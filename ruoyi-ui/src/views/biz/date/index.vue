<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="搭乘日期" prop="dateTime">
        <el-date-picker clearable
                        v-model="queryParams.dateTime"
                        type="date"
                        value-format="yyyy-MM-dd"
                        placeholder="请选择搭乘日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="班次名" prop="shiftsName">
        <el-input
          v-model="queryParams.shiftsName"
          placeholder="请输入班次名"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['biz:date:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['biz:date:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['biz:date:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['biz:date:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="dateList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="日期id" align="center" prop="dateId" />
      <el-table-column label="搭乘日期" align="center" prop="dateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.dateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="班次名" align="center" prop="shiftsName" />
      <el-table-column label="班次的状态0代表不可预约，1代表可预约" align="center" prop="shiftsStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:date:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:date:remove']"
          >删除</el-button>
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

    <!-- 添加或修改班次日期管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="搭乘日期" prop="dateTime">
          <el-date-picker clearable
                          v-model="form.dateTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择搭乘日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="班次名" prop="shiftsId">
<!--          <el-input v-model="form.shiftsName" placeholder="请输入班次名" />-->
          <el-select v-model="form.shiftsId" placeholder="请选择班次">
            <el-option
              v-for="iteam in shiftsList"
              :label="iteam.shiftsName"
              :value="iteam.shiftsId"
              :key="iteam.shiftsId"
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
import { listDate, getDate, delDate, addDate, updateDate } from "@/api/biz/date";
import { listShifts2} from "@/api/biz/shifts";

export default {
  name: "Date",
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
      // 班次日期管理表格数据
      dateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        dateTime: null,
        shiftsName: null,
        shiftsStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      shiftsList:[],
    };
  },
  mounted() {
    this.getShiftsList();
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询班次日期管理列表 */
    getShiftsList() {
      this.loading = true;
      listShifts2(this.queryParams).then(response => {
        this.shiftsList = response.rows;
        this.loading = false;
      });
    },

    /** 查询班次日期管理列表 */
    getList() {
      this.loading = true;
      listDate(this.queryParams).then(response => {
        this.dateList = response.rows;
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
        dateId: null,
        dateTime: null,
        shiftsName: null,
        shiftsStatus: null
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
      this.ids = selection.map(item => item.dateId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加班次日期管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const dateId = row.dateId || this.ids
      getDate(dateId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改班次日期管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.dateId != null) {
            updateDate(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDate(this.form).then(response => {
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
      const dateIds = row.dateId || this.ids;
      this.$modal.confirm('是否确认删除班次日期管理编号为"' + dateIds + '"的数据项？').then(function() {
        return delDate(dateIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('biz/date/export', {
        ...this.queryParams
      }, `date_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
