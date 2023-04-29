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
      <el-form-item label="车长姓名" prop="leaderName">
        <el-input
          v-model="queryParams.leaderName"
          placeholder="请输入车长姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="leaderPhone">
        <el-input
          v-model="queryParams.leaderPhone"
          placeholder="请输入联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="所属企业名称" prop="enterpriseName">
        <el-input
          v-model="queryParams.enterpriseName"
          placeholder="请输入所属企业名称"
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
          v-hasPermi="['biz:leader:add']"
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
          v-hasPermi="['biz:leader:edit']"
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
          v-hasPermi="['biz:leader:remove']"
          >删除</el-button
        >
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['biz:leader:export']"
          >导出</el-button
        >
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-loading="loading"
      :data="leaderList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="车长ID，自增长" align="center" prop="leaderId" />
      <el-table-column label="车长姓名" align="center" prop="leaderName" />
      <el-table-column label="联系电话" align="center" prop="leaderPhone" />
      <el-table-column label="所属企业名称" align="center" prop="enterpriseName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['biz:leader:edit']"
            >修改</el-button
          >
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['biz:leader:remove']"
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

    <!-- 添加或修改车长管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="车长姓名" prop="leaderName">
          <el-input v-model="form.leaderName" placeholder="请输入车长姓名" />
        </el-form-item>
        <el-form-item label="联系电话" prop="leaderPhone">
          <el-input v-model="form.leaderPhone" placeholder="请输入联系电话" />
        </el-form-item>
<!--        <el-form-item label="所属企业名称" prop="enterpriseName">-->
<!--          <el-input v-model="form.enterpriseName" placeholder="请输入所属企业名称" />-->
<!--        </el-form-item>-->
        <el-form-item label="下拉所属企业名称" prop="enterpriseId">
            <el-select v-model="form.enterpriseId" placeholder="请选择所属企业">
              <el-option v-for="iteam in enterpriseList" :label="iteam.enterpriseName" :value="iteam.enterpriseId" :key="iteam.enterpriseId"/>
            </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <el-dialog :title="title" :visible.sync="openUpdate" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="车长姓名" prop="leaderName">
          <el-input v-model="form.leaderName" placeholder="请输入车长姓名" />
        </el-form-item>
        <el-form-item label="联系电话" prop="leaderPhone">
          <el-input v-model="form.leaderPhone" placeholder="请输入联系电话" />
        </el-form-item>
                <el-form-item label="所属企业名称" prop="enterpriseName">
                  <el-input v-model="EnterpriseName" placeholder="请输入所属企业名称" disabled="true"/>
                </el-form-item>
<!--        <el-form-item label="下拉所属企业名称" prop="enterpriseId">-->
<!--          <el-select v-model="form.enterpriseId" placeholder="请选择所属企业">-->
<!--            <el-option v-for="iteam in enterpriseList" :label="iteam.enterpriseName" :value="iteam.enterpriseId" :key="iteam.enterpriseId"/>-->
<!--          </el-select>-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listEnterprise } from "@/api/biz/enterprise";
import {
addLeader,
delLeader,
getLeader,
listLeader,
updateLeader,
} from "@/api/biz/leader";

export default {
  name: "Leader",
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
      // 车长管理表格数据
      leaderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      openUpdate:false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        leaderName: null,
        leaderPhone: null,
        enterpriseName: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      enterpriseList:[],
      EnterpriseName:null,
    };
  },
  mounted() {
    this.getEnterpriseList();
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询企业管理列表 */
    getEnterpriseList() {
      this.loading = true;
      listEnterprise(this.queryParams).then((response) => {
        this.enterpriseList = response.rows;
        this.loading = false;
      });
    },
    /** 查询车长管理列表 */
    getList() {
      this.loading = true;
      listLeader(this.queryParams).then((response) => {
        this.leaderList = response.rows;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.openUpdate=false,
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        leaderId: null,
        leaderName: null,
        leaderPhone: null,
        enterpriseName: null,
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
      this.ids = selection.map((item) => item.leaderId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加车长管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const leaderId = row.leaderId || this.ids;
      this.EnterpriseName=row.enterpriseName;
      getLeader(leaderId).then((response) => {
        this.form = response.data;
        this.openUpdate = true;
        this.title = "修改车长管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.leaderId != null) {
            updateLeader(this.form).then((response) => {
              this.$modal.msgSuccess("修改成功");
              this.openUpdate = false;
              this.getList();
            });
          } else {
            addLeader(this.form).then((response) => {
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
      const leaderIds = row.leaderId || this.ids;
      this.$modal
        .confirm('是否确认删除车长管理编号为"' + leaderIds + '"的数据项？')
        .then(function () {
          return delLeader(leaderIds);
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
        "biz/leader/export",
        {
          ...this.queryParams,
        },
        `leader_${new Date().getTime()}.xlsx`
      );
    },
  },
};
</script>
