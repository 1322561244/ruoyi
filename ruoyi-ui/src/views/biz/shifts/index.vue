<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="班次名" prop="shiftsName">
        <el-input
          v-model="queryParams.shiftsName"
          placeholder="请输入班次名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="发车时间" prop="shiftsDepartureTime">
        <el-date-picker
          clearable
          v-model="queryParams.shiftsDepartureTime"
          type="date"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择发车时间"
        >
        </el-date-picker>
      </el-form-item>
      <el-form-item label="车长名" prop="leaderName">
        <el-input
          v-model="queryParams.leaderName"
          placeholder="请输入车长名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车长电话" prop="leaderPhone">
        <el-input
          v-model="queryParams.leaderPhone"
          placeholder="请输入车长电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="司机名" prop="driversName">
        <el-input
          v-model="queryParams.driversName"
          placeholder="请输入司机名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="司机联系电话" prop="driversPhone">
        <el-input
          v-model="queryParams.driversPhone"
          placeholder="请输入司机联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车牌号" prop="vehiclesLicensePlate">
        <el-input
          v-model="queryParams.vehiclesLicensePlate"
          placeholder="请输入车牌号"
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
          v-hasPermi="['biz:shifts:add']"
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
          v-hasPermi="['biz:shifts:edit']"
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
          v-hasPermi="['biz:shifts:remove']"
          >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['biz:shifts:export']"
          >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="shiftsList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="班次id" align="center" prop="shiftsId" />
      <el-table-column label="班次名" align="center" prop="shiftsName" />
      <el-table-column
        label="发车时间"
        align="center"
        prop="shiftsDepartureTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{
            parseTime(scope.row.shiftsDepartureTime, "{y}-{m}-{d} {h}:{i}:{s}")
          }}</span>
        </template>
      </el-table-column>
      <el-table-column label="车长名" align="center" prop="leaderName" />
      <el-table-column label="车长电话" align="center" prop="leaderPhone" />
      <el-table-column label="司机名" align="center" prop="driversName" />
      <el-table-column label="司机联系电话" align="center" prop="driversPhone" />
      <el-table-column label="车牌号" align="center" prop="vehiclesLicensePlate" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:shifts:edit']"
            >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:shifts:remove']"
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

    <!-- 添加或修改班次管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="班次名" prop="shiftsName">
          <el-input v-model="form.shiftsName" placeholder="请输入班次名" />
        </el-form-item>
        <el-form-item label="发车时间" prop="shiftsDepartureTime">
          <el-date-picker
            clearable
            v-model="form.shiftsDepartureTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择发车时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="车长名" prop="leaderId">
          <el-select v-model="form.leaderId" placeholder="请选择车长">
            <el-option
              v-for="iteam in leaderList"
              :label="iteam.leaderName"
              :value="iteam.leaderId"
              :key="iteam.leaderId"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="司机名" prop="driversId">
          <el-select v-model="form.driversId" placeholder="请选择车长">
            <el-option
              v-for="iteam in driversList"
              :label="iteam.driversName"
              :value="iteam.driversId"
              :key="iteam.driversId"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="车牌号" prop="vehiclesId">
          <el-select v-model="form.vehiclesId" placeholder="请选择车长">
            <el-option
              v-for="iteam in vehiclesList"
              :label="iteam.vehiclesLicensePlate"
              :value="iteam.vehiclesId"
              :key="iteam.vehiclesId"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listDrivers } from "@/api/biz/drivers";
import { listLeader } from "@/api/biz/leader";
import {
  addShifts,
  delShifts,
  getShifts,
  listShifts,
  updateShifts,
} from "@/api/biz/shifts";
import { listVehicles } from "@/api/biz/vehicles";

export default {
  name: "Shifts",
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
      // 班次管理表格数据
      shiftsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shiftsName: null,
        shiftsDepartureTime: null,
        leaderId: null,
        driversId: null,
        vehiclesId: null,
        leaderName: null,
        leaderPhone: null,
        driversName: null,
        driversPhone: null,
        vehiclesLicensePlate: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      leaderList: [],
      driversList: [],
      vehiclesList: [],
    };
  },
  mounted() {
    this.getLeaderList();
    this.getDriversList();
    this.getVehiclesList();
  },
  created() {
    this.getList();
  },
  methods: {
    /**查询车长名列表*/
    getLeaderList() {
      this.loading = true;
      listLeader(this.queryParams).then((response) => {
        this.leaderList = response.rows;
        this.loading = false;
      });
    },
    /**查询司机名列表*/
    getDriversList() {
      this.loading = true;
      listDrivers(this.queryParams).then((response) => {
        this.driversList = response.rows;
        this.loading = false;
      });
    },
    /**查询车牌列表*/
    getVehiclesList() {
      this.loading = true;
      listVehicles(this.queryParams).then((response) => {
        this.vehiclesList = response.rows;
        this.loading = false;
      });
    },
    /** 查询班次管理列表 */
    getList() {
      this.loading = true;
      listShifts(this.queryParams).then((response) => {
        this.shiftsList = response.rows;
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
        shiftsId: null,
        shiftsName: null,
        shiftsDepartureTime: null,
        leaderName: null,
        leaderPhone: null,
        driversName: null,
        driversPhone: null,
        vehiclesLicensePlate: null,
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
      this.ids = selection.map((item) => item.shiftsId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加班次管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const shiftsId = row.shiftsId || this.ids;
      getShifts(shiftsId).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改班次管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.shiftsId != null) {
            updateShifts(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addShifts(this.form).then((response) => {
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
      const shiftsIds = row.shiftsId || this.ids;
      this.$modal
        .confirm('是否确认删除班次管理编号为"' + shiftsIds + '"的数据项？')
        .then(function () {
          return delShifts(shiftsIds);
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
        "biz/shifts/export",
        {
          ...this.queryParams,
        },
        `shifts_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
