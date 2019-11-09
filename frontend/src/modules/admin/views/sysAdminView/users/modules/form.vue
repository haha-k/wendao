<template>
  <el-dialog
    :title="isAdd ? '新增用户' : '编辑用户'"
    :visible.sync="dialog"
    :width="isAdd ?'400px':'800px'"
    :append-to-body="true"
  >
    <el-form :model="form" ref="form" :rules="rules" size="small" label-width="80px">
      <el-row>
        <el-col :span="12">
          <el-form-item label="用户名" prop="username">
            <el-input v-model="form.username" :disabled="isAdd === false" style="width:280px;"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12" v-if="isAdd===false">
          <el-form-item label="昵称" prop="nickname">
            <el-input v-model="form.nickname" style="width:280px;"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row v-if="isAdd===true">
        <el-col :span="12">
          <el-form-item label="密码" prop="password">
            <el-input v-model="form.password" style="width:280px;"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- <el-row v-if="isAdd===true">
        <el-col :span="12">
          <el-form-item label="确认密码" prop="checkPassword">
            <el-input v-model="form.checkPassword" style="width:280px;"></el-input>
          </el-form-item>
        </el-col>
      </el-row>-->
      <el-row>
        <el-col :span="12">
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="form.email" style="width:280px;"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12">
          <el-form-item label="手机号码" prop="telephone">
            <el-input v-model="form.telephone" style="width:280px;"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row v-if="isAdd===false">
        <el-col :span="12">
          <el-form-item label="生日">
            <el-date-picker
              v-model="form.birthdate"
              type="date"
              placeholder="请输入日期"
              style="width:280px"
            ></el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="性别">
            <el-radio v-model="form.gender" label="1">男</el-radio>
            <el-radio v-model="form.gender" label="0">女</el-radio>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row v-if="isAdd===false">
        <el-col :span="12">
          <el-form-item label="状态">
            <el-radio v-model="form.is_active" label="true">激活</el-radio>
            <el-radio v-model="form.is_active" label="false">锁定</el-radio>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="cancel" type="text">取 消</el-button>
      <el-button :loading="loading" type="primary" @click="doSubmit">确 定</el-button>
    </span>
  </el-dialog>
</template>
<script>
import { isvalidPhone } from "#/utils/validate";

export default {
  name: "eForm",
  data() {
    var validPhone = (rule, value, callback) => {
      if (!value) {
        callback();
      } else if (!isvalidPhone(value)) {
        callback(new Error("请输入正确的11位手机号码"));
      } else {
        callback();
      }
    };
    return {
      dialog: false,
      loading: false,
      form: {
        username: "",
        nickname: "",
        email: "",
        telephone: "",
        is_active: "true",
        birthdate: "",
        gender: ""
      },
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { min: 3, max: 20, message: "需要3到10个字符", trigger: ["blur", "change"] }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          {
            min: 6,
            max: 20,
            message: "需要6到10个字符",
            trigger: ["blur", "change"]
          }
        ],
        nickname: [
          { min: 3, max: 20, message: "需要3到10个字符", trigger: "blur" }
        ],
        email: [
          {
            type: "email",
            message: "请输入正确的邮箱",
            trigger: ["blur", "change"]
          }
        ],
        telephone: [{ trigger: "change", validator: validPhone }]
      }
    };
  },
  methods: {
    resetForm() {
      this.dialog = false;
      this.$refs["form"].resetFields();
      this.form = {
        username: "",
        nickname: "",
        email: "",
        telephone: "",
        is_active: "true",
        birthdate: "",
        gender: ""
      };
    },
    doSubmit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.loading = true;
          console.log("hefa");
          if (this.isAdd) {
            this.doAdd();
          } else this.doEdit();
        } else {
         this.$message({
          showClose: true,
          message: "很抱歉哦有错误",
          type: 'error'
        });
          return false;
        }
      });
    },
    cancel() {
      this.resetForm();
    },
    doAdd() {
      console.log("TODO--->新增用户");
      this.loading = false;
    },
    doEdit() {
      console.log("TODO--->编辑用户");
      this.loading = false;
    }
  },
  mounted() {},
  components: {},
  props: {
    isAdd: {
      type: Boolean,
      required: true
    }
  }
};
</script>
<style lang="scss" scoped>
.form {
}
</style>
