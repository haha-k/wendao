
<template>
  <el-card class="box-card">
    <div slot="header">
      <span>登录</span>
    </div>

    <el-form
      :model="ruleForm"
      status-icon
      :rules="rules"
      ref="ruleForm"
      label-position="left"
      label-width="0px"
      class="demo-ruleForm"
      size="mini"
      hide-required-asterisk="true"
      inline-message="true"
    >
      <el-form-item prop="username" required="true" size="mini">
        <el-input :placeholder="holder" v-model="ruleForm.username" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input placeholder="密码" type="password" v-model="ruleForm.password" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="large" @click="submitForm('ruleForm')">登录</el-button>
      </el-form-item>
    </el-form>
    <span class="sp">
      没有账号？
      <router-link :to="register">注册</router-link>
      <router-view></router-view>
    </span>
  </el-card>
</template>
<script>
export default {
  name: "login",

  data() {
    var validatePass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入密码"));
      } else if (value.length < 6 || value.length > 20) {
        callback(new Error("密码必须是6-20个字符哦"));
      } else {
        callback();
      }
    };
    var validateUsername = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入用户名"));
      } else if (value.length < 2 || value.length > 20) {
        callback(new Error("用户名要2-20个字符哦"));
      } else {
        callback();
      }
    };
    return {
      error_pwd_message: "",
      remember: true,
      register: {
        name: "register"
      },
      holder: "用户名",
      ruleForm: {
        username: "",
        password: ""
      },
      rules: {
        password: [
          {
            validator: validatePass,
            trigger: "blur"
          }
        ],
        username: [
          {
            validator: validateUsername,
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    submitForm: function(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          // console.log(this.ruleForm["username"]);
          // console.log(this.ruleForm["password"]);
          var url1 = "/api/account/authorizations";
          var url2 = "http://localhost:8000/api/account/authorizations/";
              this.$router.push('/home');
          this.$axios
            .post(url2, {
              username: this.ruleForm["username"],
              password: this.ruleForm["password"]
            })
            .then(response => {
              console.log(response);
              if (this.remember) {
                // 记住登录
                sessionStorage.clear();
                localStorage.token = response.data.token;
                localStorage.user_id = response.data.user_id;
                localStorage.username = response.data.username;
                localStorage.is_login = true;
              } else {
                // 未记住登录
                localStorage.clear();
                sessionStorage.token = response.data.token;
                sessionStorage.user_id = response.data.user_id;
                sessionStorage.username = response.data.username;
                sessionStorage.is_login = true;
              }

              // cookie.setCookie('uid',response.data.user_id,7);
              // cookie.setCookie('name',response.data.username,7);
              // cookie.setCookie('token',response.data.token,7);
              // cookie.setCookie('is_login',true,7);
              // location.href = "/#/home";
              this.$router.push('/home');
              // 跳转页面
              // var return_url = this.get_query_string("next");
              // if (!return_url) {
              // return_url = "/index";
              // }
              // location.href = return_url;
            })
            .catch(err => {
              console.log(err);
              if (err.response.status == 400) {
                this.error_pwd_message = "用户名或密码错误";
                this.$message({
                  showClose: true,
                  message: "用户名或密码错误",
                  type: "error"
                });
              } else {
                this.error_pwd_message = "服务器错误";
                this.$message({
                  showClose: true,
                  message: "服务器错误",
                  type: "error"
                });
              }
            });
        } else {
          console.log("error");
          return false;
        }
      });
    }
  },
  mounted() {},
  components: {}
};
</script>
<style>
.el-input__inner {
  height: 50px !important;
  line-height: 50px !important;
  font-size: 14px !important;
}
.el-form-item__error,
.el-form-item__label {
  font-size: 14px;
  font-weight: 600;
  text-align: left;
}
</style>
<style lang="scss" scoped>
.box-card {
  width: 420px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  .demo-ruleForm {
    // height: 30px;
    // font-size: 14px;
    // font-style: normal;
  }
  router-link {
    display: block;
    // width: 150px;
    float: left;
    font-size: 22px;
    // text-align: right;
  }
  .sp {
    font-size: 14px;
    .el-link {
      font-size: 14px;
    }
  }
  .el-button {
    // height: ;
    width: 100%;
  }
}

a {
  display: inline;
  text-decoration: none;
  font-size: 14px;
  color: rgb(129, 206, 174);
  font-weight: 600;
}
.router-link-active {
  text-decoration: none;
}
// .el-input_inner{
//   height: 30px;
//   border-top: none;
// }
</style>
