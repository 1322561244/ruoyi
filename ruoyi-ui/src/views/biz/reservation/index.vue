<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="班次名" prop="shiftsName">
        <el-input
          v-model="queryParams.shiftsName"
          placeholder="请输入班次名"
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
      <el-form-item label="司机姓名" prop="driversName">
        <el-input
          v-model="queryParams.driversName"
          placeholder="请输入司机姓名"
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
      <el-form-item label="车长姓名" prop="leaderName">
        <el-input
          v-model="queryParams.leaderName"
          placeholder="请输入车长姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="车长联系电话" prop="leaderPhone">
        <el-input
          v-model="queryParams.leaderPhone"
          placeholder="请输入车长联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="预约的发车时间" prop="reservationTime">
        <el-date-picker clearable
                        v-model="queryParams.reservationTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择预约的发车时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="乘客名" prop="passengerName">
        <el-input
          v-model="queryParams.passengerName"
          placeholder="请输入乘客名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="乘客所属部门" prop="deptName">
        <el-input
          v-model="queryParams.deptName"
          placeholder="请输入乘客所属部门"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="乘客所属企业" prop="enterpriseName">
        <el-input
          v-model="queryParams.enterpriseName"
          placeholder="请输入乘客所属企业"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="乘客联系电话" prop="passengerPhone">
        <el-input
          v-model="queryParams.passengerPhone"
          placeholder="请输入乘客联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创建时间" prop="creationTime">
        <el-date-picker clearable
                        v-model="queryParams.creationTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
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
          v-hasPermi="['biz:reservation:add']"
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
          v-hasPermi="['biz:reservation:edit']"
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
          v-hasPermi="['biz:reservation:remove']"
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
          v-hasPermi="['biz:reservation:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="reservationList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="预约id" align="center" prop="reservationId"/>
      <el-table-column label="班次名" align="center" prop="shiftsName"/>
      <el-table-column label="车牌号" align="center" prop="vehiclesLicensePlate"/>
      <el-table-column label="司机姓名" align="center" prop="driversName"/>
      <el-table-column label="司机联系电话" align="center" prop="driversPhone"/>
      <el-table-column label="车长姓名" align="center" prop="leaderName"/>
      <el-table-column label="车长联系电话" align="center" prop="leaderPhone"/>
      <el-table-column label="预约的发车时间" align="center" prop="reservationTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.reservationTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="乘客名" align="center" prop="passengerName"/>
      <el-table-column label="乘客所属部门" align="center" prop="deptName"/>
      <el-table-column label="乘客所属企业" align="center" prop="enterpriseName"/>
      <el-table-column label="乘客联系电话" align="center" prop="passengerPhone"/>
      <el-table-column label="创建时间" align="center" prop="creationTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.creationTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="预约状态1代表已预约，0代表已取消" align="center" prop="reservationStatus"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:reservation:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:reservation:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加预约管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="班次名" prop="shiftsId">
          <!--          <el-input v-model="form.shiftsName" placeholder="请输入班次名" />-->
          <el-select v-model="form.shiftsName" placeholder="请选择班次" @change="updateOrderList(form.shiftsName)">
            <el-option v-for="iteam in shiftsList" :label="iteam.shiftsName" :value="iteam" :key="iteam.shiftsId"/>
          </el-select>
        </el-form-item>
        <el-form-item label="乘客名" prop="passengerName">
          <!--          <el-input v-model="form.passengerName" placeholder="请输入乘客名" />-->
          <el-select v-model="form.passengerName" placeholder="请选择乘客"
                     @change="updateOrderList2(form.passengerName)">
            <el-option v-for="iteam in passengerList" :label="iteam.passengerName" :value="iteam"
                       :key="iteam.passengerId"/>
          </el-select>
        </el-form-item>
        <el-form-item label="预约的发车时间" prop="reservationTime">
          <el-date-picker clearable
                          v-model="form.reservationTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择预约的发车时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="创建时间" prop="creationTime">
          <el-date-picker clearable
                          v-model="form.creationTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="车牌号" prop="vehiclesLicensePlate">
          <el-input v-model="form.vehiclesLicensePlate" placeholder="请输入车牌号" disabled="true"/>
        </el-form-item>
        <el-form-item label="司机姓名" prop="driversName">
          <el-input v-model="form.driversName" :value="shiftsList.driversName" disabled="true"/>
        </el-form-item>
        <el-form-item label="司机联系电话" prop="driversPhone">
          <el-input v-model="form.driversPhone" placeholder="请输入司机联系电话" disabled="true"/>
        </el-form-item>
        <el-form-item label="车长姓名" prop="leaderName">
          <el-input v-model="form.leaderName" placeholder="请输入车长姓名" disabled="true"/>
        </el-form-item>
        <el-form-item label="车长联系电话" prop="leaderPhone">
          <el-input v-model="form.leaderPhone" placeholder="请输入车长联系电话" disabled="true"/>
        </el-form-item>
        <el-form-item label="乘客所属部门" prop="deptName">
          <el-input v-model="form.deptName" placeholder="请输入乘客所属部门" disabled="true"/>
        </el-form-item>
        <el-form-item label="乘客所属企业" prop="enterpriseName">
          <el-input v-model="form.enterpriseName" placeholder="请输入乘客所属企业" disabled="true"/>
        </el-form-item>
        <el-form-item label="乘客联系电话" prop="passengerPhone">
          <el-input v-model="form.passengerPhone" placeholder="请输入乘客联系电话" disabled="true"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 修改预约管理对话框 -->
    <el-dialog :title="title" :visible.sync="openUpdate" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="班次名" prop="shiftsId">
          <!--          <el-input v-model="form.shiftsName" placeholder="请输入班次名" />-->
          <el-select v-model="form.shiftsId" placeholder="请选择班次名" @change="updateOrderList3(form.shiftsId)">
            <el-option v-for="iteam in shiftsList" :label="iteam.shiftsName" :value="iteam.shiftsId"
                       :key="iteam.shiftsId"/>
          </el-select>
        </el-form-item>
        <el-form-item label="乘客名" prop="passengerId">
          <!--          <el-input v-model="form.passengerName" placeholder="请输入乘客名" />-->
          <el-select v-model="form.passengerId" placeholder="请选择乘客" @change="updateOrderList4(form.passengerId)">
            <el-option v-for="iteam in passengerList" :label="iteam.passengerName" :value="iteam.passengerId"
                       :key="iteam.passengerId"/>
          </el-select>
        </el-form-item>
        <el-form-item label="预约的发车时间" prop="reservationTime">
          <el-date-picker clearable
                          v-model="form.reservationTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择预约的发车时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="创建时间" prop="creationTime">
          <el-date-picker clearable
                          v-model="form.creationTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="车牌号" prop="vehiclesLicensePlate">
          <el-input v-model="form.vehiclesLicensePlate" placeholder="请输入车牌号" disabled="true"/>
        </el-form-item>
        <el-form-item label="司机姓名" prop="driversName">
          <el-input v-model="form.driversName" :value="shiftsList.driversName" disabled="true"/>
        </el-form-item>
        <el-form-item label="司机联系电话" prop="driversPhone">
          <el-input v-model="form.driversPhone" placeholder="请输入司机联系电话" disabled="true"/>
        </el-form-item>
        <el-form-item label="车长姓名" prop="leaderName">
          <el-input v-model="form.leaderName" placeholder="请输入车长姓名" disabled="true"/>
        </el-form-item>
        <el-form-item label="车长联系电话" prop="leaderPhone">
          <el-input v-model="form.leaderPhone" placeholder="请输入车长联系电话" disabled="true"/>
        </el-form-item>
        <el-form-item label="乘客所属部门" prop="deptName">
          <el-input v-model="form.deptName" placeholder="请输入乘客所属部门" disabled="true"/>
        </el-form-item>
        <el-form-item label="乘客所属企业" prop="enterpriseName">
          <el-input v-model="form.enterpriseName" placeholder="请输入乘客所属企业" disabled="true"/>
        </el-form-item>
        <el-form-item label="乘客联系电话" prop="passengerPhone">
          <el-input v-model="form.passengerPhone" placeholder="请输入乘客联系电话" disabled="true"/>
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
import {
  addReservation,
  delReservation,
  getReservation, getReservation2,
  listReservation,
  updateReservation
} from "@/api/biz/reservation";
import {getShifts2, listShifts} from "@/api/biz/shifts";
import {getPassenger2, listPassenger} from "@/api/biz/passenger";

export default {
  name: "Reservation",
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
      // 预约管理表格数据
      reservationList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openUpdate: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        shiftsName: null,
        vehiclesLicensePlate: null,
        driversName: null,
        driversPhone: null,
        leaderName: null,
        leaderPhone: null,
        reservationTime: null,
        passengerName: null,
        deptName: null,
        enterpriseName: null,
        passengerPhone: null,
        creationTime: null,
        reservationStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      shiftsList: [],
      passengerList: [],
      ShiftsName: null,
      //   测试
    };
  },
  mounted() {
    this.getShiftsList();
    this.getPassengerList();
  },
  created() {
    this.getList();
  },
  methods: {

    updateOrderList(iteam) {
      this.form.vehiclesLicensePlate = iteam.vehiclesLicensePlate;
      this.form.driversName = iteam.driversName;
      this.form.driversPhone = iteam.driversPhone;
      this.form.leaderName = iteam.leaderName;
      this.form.leaderPhone = iteam.leaderPhone;
    },
    updateOrderList2(iteam) {
      this.form.passengerName = iteam.passengerName;
      this.form.enterpriseName = iteam.enterpriseName;
      this.form.deptName = iteam.deptName;
      this.form.passengerPhone = iteam.passengerPhone;
    },
    updateOrderList3(shiftsId) {
      getShifts2(shiftsId).then(response => {
        this.form.shiftsName = response.data.shiftsName;
        this.form.vehiclesLicensePlate = response.data.vehiclesLicensePlate;
        this.form.driversName = response.data.driversName;
        this.form.driversPhone = response.data.driversPhone;
        this.form.leaderName = response.data.leaderName;
        this.form.leaderPhone = response.data.leaderPhone;
      });
    },
    updateOrderList4(passengerId) {
      getPassenger2(passengerId).then(response => {
        this.form.passengerName = response.data.passengerName;
        this.form.enterpriseName = response.data.enterpriseName;
        this.form.deptName = response.data.deptName;
        this.form.passengerPhone = response.data.passengerPhone;
      });
    },

    /** 查询所有班次名*/
    getShiftsList() {
      this.loading = true;
      listShifts(this.queryParams).then((response) => {
        this.shiftsList = response.rows;

        this.loading = false;
      });
    },

    /** 查询所有乘客名*/
    getPassengerList() {
      this.loading = true;
      listPassenger(this.queryParams).then((response) => {
        this.passengerList = response.rows;
        this.loading = false;
      });
    },
    /** 查询预约管理列表 */
    getList() {
      this.loading = true;
      listReservation(this.queryParams).then(response => {
        this.reservationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.openUpdate = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        reservationId: null,
        shiftsName: null,
        vehiclesLicensePlate: null,
        driversName: null,
        driversPhone: null,
        leaderName: null,
        leaderPhone: null,
        reservationTime: null,
        passengerName: null,
        deptName: null,
        enterpriseName: null,
        passengerPhone: null,
        creationTime: null,
        reservationStatus: null
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
      this.ids = selection.map(item => item.reservationId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加预约管理";
    },
    /** 修改按钮操作 */
    /********************需要改这里***********************/
    handleUpdate(row) {
      this.reset();
      const reservationId = row.reservationId || this.ids;
      this.form.vehiclesLicensePlate = row.vehiclesLicensePlate;
      this.form.driversName = row.driversName;
      this.form.driversPhone = row.driversName;
      this.form.leaderName = row.leaderName;
      this.form.leaderPhone = row.leaderPhone;
      this.form.passengerName = row.passengerName;
      this.form.deptName = row.deptName;
      this.form.enterpriseName = row.enterpriseName;
      this.form.passengerPhone = row.passengerPhone;
      getReservation2(reservationId).then(response => {
        this.form = response.data;
        this.openUpdate = true;
        this.title = "修改预约管理";
      });

    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.reservationId != null) {
            updateReservation(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.openUpdate = false;
              this.getList();
            });
          } else {
            addReservation(this.form).then(response => {
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
      const reservationIds = row.reservationId || this.ids;
      this.$modal.confirm('是否确认删除预约管理编号为"' + reservationIds + '"的数据项？').then(function () {
        return delReservation(reservationIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('biz/reservation/export', {
        ...this.queryParams
      }, `reservation_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
