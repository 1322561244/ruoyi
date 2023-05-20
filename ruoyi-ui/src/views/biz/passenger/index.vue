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
      <el-form-item label="乘客姓名" prop="passengerName">
        <el-input
          v-model="queryParams.passengerName"
          placeholder="请输入乘客姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属企业名称" prop="enterpriseName" labelWidth="110px">
        <el-input
          v-model="queryParams.enterpriseName"
          placeholder="请输入所属企业名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属部门名称" prop="deptName" labelWidth="110px">
        <el-input
          v-model="queryParams.deptName"
          placeholder="请输入所属部门名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="passengerPhone">
        <el-input
          v-model="queryParams.passengerPhone"
          placeholder="请输入联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery"
          >搜索
        </el-button>
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
          v-hasPermi="['biz:passenger:add']"
          >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['biz:passenger:edit']"
          >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['biz:passenger:remove']"
          >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-upload2"
          size="mini"
          @click="handleImport"
          v-hasPermi="['biz:passenger:import']"
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
          v-hasPermi="['biz:passenger:export']"
          >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="passengerList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <!-- <el-table-column label="乘客ID，自增长" align="center" prop="passengerId" /> -->
      <el-table-column label="乘客姓名" align="center" prop="passengerName" />
      <el-table-column label="所属企业名称" align="center" prop="enterpriseName" />
      <el-table-column label="所属部门名称" align="center" prop="deptName" />
      <el-table-column label="联系电话" align="center" prop="passengerPhone" />
      <el-table-column
        label="乘客照片1"
        align="center"
        prop="passengerPhoto1"
        width="100"
      >
        <template slot-scope="scope">
          <image-preview :src="scope.row.passengerPhoto1" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column
        label="乘客照片2"
        align="center"
        prop="passengerPhoto2"
        width="100"
      >
        <template slot-scope="scope">
          <image-preview :src="scope.row.passengerPhoto2" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column
        label="乘客照片3"
        align="center"
        prop="passengerPhoto3"
        width="100"
      >
        <template slot-scope="scope">
          <image-preview :src="scope.row.passengerPhoto3" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="账号名" align="center" prop="userName" />
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
            v-hasPermi="['biz:passenger:edit']"
            >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:passenger:remove']"
            >删除
          </el-button>
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

    <!-- 添加或修改乘客管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="550px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="乘客姓名" prop="passengerName">
          <el-input v-model="form.passengerName" placeholder="请输入乘客姓名" />
        </el-form-item>
        <el-form-item label="所属企业名称" prop="enterpriseId">
          <el-select
            v-model="form.enterpriseId"
            placeholder="请选择所属企业"
            @change="UpdateDept(form.enterpriseId)"
          >
            <el-option
              v-for="iteam in enterpriseList"
              :label="iteam.enterpriseName"
              :value="iteam.enterpriseId"
              :key="iteam.enterpriseId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="所属部门名称" prop="deptId">
          <el-select v-model="form.deptId" placeholder="请选择所属部门">
            <el-option
              v-for="iteam in deptList"
              :label="iteam.deptName"
              :value="iteam.deptId"
              :key="iteam.deptId"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="联系电话" prop="passengerPhone">
          <el-input v-model="form.passengerPhone" placeholder="请输入联系电话" />
        </el-form-item>
        <el-form-item label="乘客照片1" prop="passengerPhoto1">
          <image-upload v-model="form.passengerPhoto1" :limit="1" />
        </el-form-item>
        <el-form-item label="乘客照片2" prop="passengerPhoto2">
          <image-upload v-model="form.passengerPhoto2" :limit="1" />
        </el-form-item>
        <el-form-item label="乘客照片3" prop="passengerPhoto3">
          <image-upload v-model="form.passengerPhoto3" :limit="1" />
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
import { listEnterprise } from "@/api/biz/enterprise";
import {
  addPassenger,
  delPassenger,
  getPassenger,
  listPassenger,
  updatePassenger,
} from "@/api/biz/passenger";
import { selectDept } from "@/api/system/dept";
import { getToken } from "@/utils/auth";

export default {
  name: "Passenger",
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
      // 乘客管理表格数据
      passengerList: [],
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
        url: process.env.VUE_APP_BASE_API + "/biz/passenger/importData", // todo
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        passengerName: null,
        enterpriseName: null,
        deptName: null,
        passengerPhone: null,
        passengerPhoto1: null,
        passengerPhoto2: null,
        passengerPhoto3: null,
        userId: null,
        deptId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        passengerName: [{ required: true, message: "乘客姓名不能为空", trigger: "blur" }],
        passengerPhone: [
          { required: true, message: "联系电话不能为空", trigger: "blur" },
        ],
      },
      deptList: [],
      enterpriseList: [],
    };
  },
  mounted() {
    this.getEnterpriseList();
  },
  created() {
    this.getList();
  },
  methods: {
    /* 选择企业时关联部门 */
    UpdateDept(enterpriseId) {
      selectDept(enterpriseId).then((response) => {
        this.deptList = response.data;
        this.loading = false;
      });
    },
    /** 查询企业管理列表 */
    getEnterpriseList() {
      this.loading = true;
      listEnterprise(this.queryParams).then((response) => {
        this.enterpriseList = response.rows;
        this.loading = false;
      });
    },
    /** 查询乘客管理列表 */
    getList() {
      this.loading = true;
      listPassenger(this.queryParams).then((response) => {
        this.passengerList = response.rows;
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
        passengerId: null,
        passengerName: null,
        enterpriseName: null,
        deptName: null,
        passengerPhone: null,
        passengerPhoto1: null,
        passengerPhoto2: null,
        passengerPhoto3: null,
        userId: null,
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
      this.ids = selection.map((item) => item.passengerId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加乘客管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const passengerId = row.passengerId || this.ids;
      getPassenger(passengerId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改乘客管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.passengerId != null) {
            updatePassenger(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPassenger(this.form).then((response) => {
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
      const passengerIds = row.passengerId || this.ids;
      this.$modal
        .confirm('是否确认删除选中的数据项？')
        .then(function () {
          return delPassenger(passengerIds);
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
        "biz/passenger/export",
        {
          ...this.queryParams,
        },
        `passenger_${new Date().getTime()}.xlsx`
      );
    },
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "乘客基本信息导入"; // todo
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      this.download(
        "biz/passenger/importTemplate",
        {},
        `passenger_base_template_${new Date().getTime()}.xlsx`
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
