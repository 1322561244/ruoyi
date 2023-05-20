<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="80px"
    >
      <el-form-item label="车牌号码" prop="vehiclesLicensePlate">
        <el-input
          v-model="queryParams.vehiclesLicensePlate"
          placeholder="请输入车牌号码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车辆型号" prop="vehiclesModel">
        <el-input
          v-model="queryParams.vehiclesModel"
          placeholder="请输入车辆型号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="限载人数" prop="vehiclesCapacity">
        <el-input
          v-model="queryParams.vehiclesCapacity"
          placeholder="请输入车辆限载人数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属公司或供应商" prop="vehiclesSupplier" labelWidth="130px">
        <el-input
          v-model="queryParams.vehiclesSupplier"
          placeholder="请输入车辆所属公司或供应商"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['biz:vehicles:add']"
          >新增</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['biz:vehicles:edit']"
          >修改</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['biz:vehicles:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-upload2"
          size="mini"
          @click="handleImport"
          v-hasPermi="['collegeManage:studentBase:import']"
          >导入</el-button
        >
      </el-col>

      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['biz:vehicles:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="vehiclesList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="车牌号码" align="center" prop="vehiclesLicensePlate" />
      <el-table-column label="车辆型号" align="center" prop="vehiclesModel" />
      <el-table-column label="车辆限载人数" align="center" prop="vehiclesCapacity" />
      <el-table-column
        label="车辆所属公司或供应商"
        align="center"
        prop="vehiclesSupplier"
      />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, "{y}-{m}-{d} {h}:{i}:{s}") }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:vehicles:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:vehicles:remove']"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改车辆管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="140px">
        <el-form-item label="车牌号码" prop="vehiclesLicensePlate">
          <el-input
            v-model="form.vehiclesLicensePlate"
            placeholder="请输入车辆的车牌号码"
          />
        </el-form-item>
        <el-form-item label="车辆型号" prop="vehiclesModel">
          <el-input v-model="form.vehiclesModel" placeholder="请输入车辆的型号" />
        </el-form-item>
        <el-form-item label="车辆限载人数" prop="vehiclesCapacity">
          <el-input
            v-model="form.vehiclesCapacity"
            placeholder="请输入车辆最多可搭载乘客数"
          />
        </el-form-item>
        <el-form-item label="所属公司或供应商" prop="vehiclesSupplier">
          <el-input
            v-model="form.vehiclesSupplier"
            placeholder="请输入车辆所属公司或供应商"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 用户导入对话框 -->
    <el-dialog
      :title="upload.title"
      :visible.sync="upload.open"
      width="400px"
      append-to-body
    >
      <el-upload
        ref="upload"
        :limit="1"
        accept=".xlsx, .xls"
        :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport"
        :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress"
        :on-success="handleFileSuccess"
        :auto-upload="false"
        drag
      >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
          <div class="el-upload__tip" slot="tip">
            <el-checkbox v-model="upload.updateSupport" /> 是否更新已经存在的用户数据
          </div>
          <span>仅允许导入xls、xlsx格式文件。</span>
          <el-link
            type="primary"
            :underline="false"
            style="font-size: 12px; vertical-align: baseline"
            @click="importTemplate"
            >下载模板</el-link
          >
        </div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  addVehicles,
  delVehicles,
  getVehicles,
  listVehicles,
  updateVehicles,
} from "@/api/biz/vehicles";
import { getToken } from "@/utils/auth";

export default {
  name: "Vehicles",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 车辆管理表格数据
      vehiclesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,

      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/biz/vehicles/importData", // todo
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        vehiclesLicensePlate: null,
        vehiclesModel: null,
        vehiclesCapacity: null,
        vehiclesSupplier: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        vehiclesLicensePlate: [
          { required: true, message: "车辆的车牌号码不能为空", trigger: "blur" },
        ],
        vehiclesModel: [
          { required: true, message: "车辆的型号不能为空", trigger: "blur" },
        ],
        vehiclesCapacity: [
          { required: true, message: "车辆最多可搭载乘客数不能为空", trigger: "blur" },
        ],
        vehiclesSupplier: [
          {
            required: true,
            message: "提供车辆的公司或供应商名称不能为空",
            trigger: "blur",
          },
        ],
      },
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询车辆管理列表 */
    getList() {
      this.loading = true;
      listVehicles(this.queryParams).then((response) => {
        this.vehiclesList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        vehiclesId: null,
        vehiclesLicensePlate: null,
        vehiclesModel: null,
        vehiclesCapacity: null,
        vehiclesSupplier: null,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.vehiclesId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加车辆管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const vehiclesId = row.vehiclesId || this.ids;
      getVehicles(vehiclesId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改车辆管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.vehiclesId != null) {
            updateVehicles(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addVehicles(this.form).then((response) => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const vehiclesIds = row.vehiclesId || this.ids;
      this.$modal
        .confirm('是否确认删除选中的数据项？')
        .then(function () {
          return delVehicles(vehiclesIds);
        })
        .then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        "biz/vehicles/export",
        {
          ...this.queryParams,
        },
        `vehicles_${new Date().getTime()}.xlsx`
      );
    },

    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "车辆基本信息导入"; // todo
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download(
        "biz/vehicles/importTemplate",
        {},
        `vehicles_base_template_${new Date().getTime()}.xlsx`
      ); // todo
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert(
        "<div style='overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;'>" +
          response.msg +
          "</div>",
        "导入结果",
        { dangerouslyUseHTMLString: true }
      );
      this.getList();
    },
    // 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit();
    },
  },
};
</script>
