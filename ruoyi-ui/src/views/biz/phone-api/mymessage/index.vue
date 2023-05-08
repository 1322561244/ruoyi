<template>
  <div>
    <el-form ref="elForm" :model="form" :rules="rules" size="medium" label-width="100px">
      <el-form-item label="姓名" prop="passengerName">
        <el-input v-model="form.passengerName" placeholder="请输入姓名" :maxlength="11" show-word-limit
                  clearable prefix-icon='el-icon-mobile' :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label="所属企业" prop="enterpriseId">
        <el-select v-model="form.enterpriseId" placeholder="请选择所属部门" clearable :style="{width: '100%'}" @change="test(form.enterpriseId)">
          <el-option v-for="item in enterpriseList" :key="item.enterpriseId" :label="item.enterpriseName"
                     :value="item.enterpriseId" :disabled="item.disabled"></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="所属部门" prop="deptId">
        <el-select v-model="form.deptId" placeholder="请选择所属部门" clearable :style="{width: '100%'}">
          <el-option v-for="item in deptList" :key="item.deptId" :label="item.deptName"
                     :value="item.deptId" :disabled="item.disabled"></el-option>
        </el-select>
      </el-form-item>

      <el-form-item label="手机号码" prop="passengerPhone">
        <el-input v-model="form.passengerPhone" placeholder="请输入手机号码" clearable :style="{width: '100%'}"/>
      </el-form-item>

      <el-form-item label="乘客照片1" prop="passengerPhoto1">
        <image-upload v-model="form.passengerPhoto1"/>
      </el-form-item>
      <el-form-item label="乘客照片2" prop="passengerPhoto2">
        <image-upload v-model="form.passengerPhoto2"/>
      </el-form-item>
      <el-form-item label="乘客照片3" prop="passengerPhoto3">
        <image-upload v-model="form.passengerPhoto3"/>
      </el-form-item>
      <el-form-item size="large">
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import {addPassenger, listPassenger} from "@/api/biz/passenger";
import {listEnterprise} from "@/api/biz/enterprise";
import {listDept, selectDept} from "@/api/system/dept";

export default {
  components: {},
  props: [],
  data() {
    return {
      form: {
        passengerName: '',
        field102: undefined,
        passengerPhone: undefined,
        passengerPhoto1: null,
      },
      rules: {
        passengerName: [{
          required: true,
          message: '请输入姓名',
          trigger: 'blur'
        }],
        deptId: [{
          required: true,
          message: '请选择所属部门',
          trigger: 'change'
        }],
        passengerPhone: [{
          required: true,
          message: '请输入手机号码',
          trigger: 'blur'
        }],
      },
      enterpriseList:[],
      deptList:[],
    }
  },
  computed: {},
  watch: {},
  created() {

  },
  mounted() {
    this.getEnterpriseList();
    this.getDeptList();
  },
  methods: {
    test(enterpriseId){
      this.loading=true;
      selectDept(enterpriseId).then(response => {
        this.deptList = response.rows;
        this.loading = false;
      });
    },
    getEnterpriseList(){
      this.loading = true;
      listEnterprise(this.queryParams).then(response => {
        this.enterpriseList = response.rows;
        this.loading = false;
      });
    },
    getDeptList(){
      this.loading=true;
      listDept(this.queryParams).then(response => {
        this.deptList = response.rows;
        this.loading = false;
      });
    },
    submitForm() {
      this.$refs['elForm'].validate(valid => {
        if (valid) {
          addPassenger(this.form).then(response => {
            this.$modal.msgSuccess("新增成功");
            this.open = false;
            this.getList();
          });
        }
      })
    },
    resetForm() {
      this.$refs['elForm'].resetFields()
    },
    passengerPhoto1BeforeUpload(file) {
      let isRightSize = file.size / 1024 / 1024 < 2
      if (!isRightSize) {
        this.$message.error('文件大小超过 2MB')
      }
      let isAccept = new RegExp('image/*').test(file.type)
      if (!isAccept) {
        this.$message.error('应该选择image/*类型的文件')
      }
      return isRightSize && isAccept
    },
  }
}

</script>
<style>
.el-upload__tip {
  line-height: 1.2;
}

</style>
