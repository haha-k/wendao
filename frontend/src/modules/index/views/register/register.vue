<template>
  <el-card class="box-card">
    <div slot="header">
      <span>注册</span>
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
        <el-input placeholder="用户名" v-model="ruleForm.username" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input placeholder="密码" type="password" v-model="ruleForm.password" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item prop="repassword">
        <el-input
          placeholder="确认密码"
          type="password"
          v-model="ruleForm.repassword"
          autocomplete="off"
        ></el-input>
      </el-form-item>
      <el-form-item prop="phone">
        <el-input placeholder="手机号" v-model="ruleForm.phone"></el-input>
      </el-form-item>
      <el-form-item prop="email">
        <el-input placeholder="邮箱" v-model="ruleForm.email"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" class="registerButton" @click="submitForm('ruleForm')">注册</el-button>
      </el-form-item>
    </el-form>
    <span class="sp">
      已有账号？
      <router-link :to="login">登录</router-link>
      <router-view></router-view>
    </span>
  </el-card>
</template>
<script>
export default {
  name: "register",
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
    var validateRepass = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入密码"));
      } else if (value !== this.ruleForm.password) {
        callback(new Error("两次输入密码不一致!"));
      } else {
        callback();
      }
    };
    var validateUsername = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请输入用户名"));
      } else if (value.length < 2 || value.length > 20) {
        callback(new Error("用户名要2-20个字符哦"));
      } else if (this.check_username()) {
        callback(new Error(this.error_name_message));
      } else {
        callback();
      }
    };
    var validatePhone = (rule, value, callback) => {
      var re = /^1[345789]\d{9}$/;
      if (re.test(value) == false) {
        callback(new Error("请输入正确的手机号哦"));
      } else {
        callback();
      }
    };
    var validateEmail = (rule, value, callback) => {
      var pattern = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
      // if(value==""){
      //   callback();
      // }else
      if (pattern.test(value) == false) {
        callback(new Error("请输入正确的邮箱号哦"));
      } else {
        callback();
      }
    };

    return {
      login: {
        name: "login"
      },
      error_username: false,
      error_name_message: "...",
      errors: {
        name: true,
        password: true,
        repassword: true,
        email: true,
        phone: true,
        allow: true,
        sms_code: true
      },
      ruleForm: {
        username: "12hahk",
        password: "159875",
        repassword: "159875",
        email: "afyypp@163.com",
        phone: "18742528639"
      },
      rules: {
        password: [
          {
            validator: validatePass,
            trigger: "blur"
          }
        ],
        repassword: [
          {
            validator: validateRepass,
            trigger: "blur"
          }
        ],
        username: [
          {
            validator: validateUsername,
            trigger: "blur"
          }
        ],
        phone: [
          {
            validator: validatePhone,
            trigger: "blur"
          }
        ],
        email: [
          {
            validator: validateEmail,
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    check_username: function() {
      var url1 =
        "/api/account/username/" +
        this.ruleForm["username"] +
        "/count/?format=json";
      var url2 =
        "http://localhost:8000/api/account/username/" +
        this.ruleForm["username"] +
        "/count/?format=json";
      this.$axios
        .get(url1)
        .then(response => {
          if (response.data.count > 0) {
            this.error_name_message = "用户名已存在";
            this.error_username = true;
            console.log("***********");
          } else {
            this.error_username = false;
          }
        })
        .catch(err => {
          console.log(err.response.data);
        });
      return this.error_username;
    },
    check_pwd() {},
    check_repwd() {},
    check_phone() {},
    check_sms_code() {},
    check_allow() {},
    check_email() {},
    check() {
      this.check_username();
      this.check_pwd();
      this.check_repwd();
      this.check_phone();
      this.check_sms_code();
      this.check_allow();
      this.check_email();
    },
    getCookie(name) {
      var value = "; " + document.cookie;
      var parts = value.split("; " + name + "=");
      if (parts.length === 2) {
        return parts
          .pop()
          .split(";")
          .shift();
      }
    },
    submitForm: function(formName) {
      // check();
      this.$refs[formName].validate(valid => {
        if (valid) {
          // var count = 0;
          // Object.keys(this.errors).forEach(key => {
          //   this.errors[key] == false ? count++ : count;
          // });
          // console.log(count);
          var url1 = "/api/account/users/";
          var url2 = "http://localhost:8000/api/account/users/";
          // if (count == 5) {
          this.$axios
            .post(
              url2,
              {
                username: this.ruleForm["username"],
                password: this.ruleForm["password"],
                email: this.ruleForm["email"],
                telephone: this.ruleForm["phone"]
              },
              {
                headers: {
                  "X-CSRFToken": this.getCookie("csrftoken")
                }
              }
            )
            .then(response => {
              location.href = "/#/login";
            })
            .catch(err => {
              console.log(err.response.data);
              if (err.response.data.username) {
                this.$message({
                  showClose: true,
                  message: err.response.data.username[0],
                  type: "error"
                });
              }
              if (err.response.data.telephone) {
                this.$message({
                  showClose: true,
                  message: err.response.data.telephone[0],
                  type: "error"
                });
              }
            });
          // }
        }
      });
    }
  }
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
  .registerButton {
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
