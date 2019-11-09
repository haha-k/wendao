<template>
  <div class="login-container">
    <el-form
      ref="loginForm"
      :model="loginForm"
      :rules="loginRules"
      class="login-form"
      auto-complete="on"
      label-position="left"
    >
      <div class="title-container">
        <h3 class="title">约健后台管理系统</h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          ref="username"
          v-model="loginForm.username"
          placeholder="Username"
          name="username"
          type="text"
          tabindex="1"
          auto-complete="on"
        />
      </el-form-item>

      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          :key="passwordType"
          ref="password"
          v-model="loginForm.password"
          :type="passwordType"
          placeholder="Password"
          name="password"
          tabindex="2"
          auto-complete="on"
          @keyup.enter.native="handleLogin"
        />
        <span class="show-pwd" @click="showPwd">
          <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'" />
        </span>
      </el-form-item>

      <el-button
        :loading="loading"
        type="primary"
        style="width:100%;margin-bottom:30px;"
        @click.native.prevent="handleLogin"
      >登录</el-button>
    </el-form>
  </div>
</template>
<script>
import { validUsername } from "#/utils/validate";
import axios from 'axios'

export default {
  name: "login",
  data() {
    const validateUsername = (rule, value, callback) => {
      if (!validUsername(value)) {
        callback(new Error("请输入正确的用户名"));
      } else {
        callback();
      }
    };
    const validatePassword = (rule, value, callback) => {
      if (value.length < 6) {
        callback(new Error("密码必须大于6位"));
      } else {
        callback();
      }
    };
    return {
      loginForm: {
        username: "haha52",
        password: "525252"
      },
      loginRules: {
        username: [
          {
            required: true,
            trigger: "blur",
            validator: validateUsername
          }
        ],
        password: [
          {
            required: true,
            trigger: "blur",
            validator: validatePassword
          }
        ]
      },
      loading: false,
      passwordType: "password",
      redirect: undefined
    };
  },
  methods: {
    showPwd() {
      if (this.passwordType === "password") {
        this.passwordType = "";
      } else {
        this.passwordType = "password";
      }
      this.$nextTick(() => {
        //**** */
        this.$refs.password.focus();
      });
      // 在下次 DOM 更新循环结束之后执行延迟回调。在修改数据之后立即使用这个方法，获取更新后的 DOM。
      // 在数据变化后要执行的某个操作，而这个操作需要使用随数据改变而改变的DOM结构的时候，
      // 这个操作都应该放进Vue.nextTick()的回调函数中。
    },
    handleLogin() {
      // *************add handleLogin logic
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          // axios.post('/api/v1/login',this.loginForm).then(function(response){
          //   console.log(response);
          // }).catch(function(error){
          //   console.log(error);
          // })
          this.$store
            .dispatch("user/login", this.loginForm)
            .then(() => {
              this.$router.push({
                path: this.redirect || '/',
              })
              this.loading = false;
              console.log("xxxxxxxxxxx")
            })
            .catch(() => {
              this.loading = false;
            });
        } else {
          console.log("错误提交");
          return false;
        }
      });
    }
  },
  mounted() {
    if (this.loginForm.username === "") {
      this.$refs.username.focus();
    } else if (this.loginForm.password === "") {
      this.$refs.password.focus();
    }
  },
  components: {},
  // watch: {
  //   $route : {
  //     handler: function (route){
  //       this.redirect = route.query;
  //     }
  //   }
  // };
};
</script>
<style lang="scss">
$bg: #ccc;
$cursor: rgb(255, 255, 255);
$light_gray: #fff;

@supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
  .login-container .el-input input {
    color: $cursor;
  }
}

.login-container {
  .el-input {
    display: inline-block;
    height: 47px;
    width: 85%;

    input {
      background: transparent; //rgba(0,0,0,0)
      width: 100%;
      border: 0px;
      border-radius: 0px;
      padding: 12px 5px 12px 15px;
      color: $light_gray;
      height: 47px;
      caret-color: $cursor;
      // outline:none;
    }

    //  &:-webkit-autofill {
    //   box-shadow: 0 0 0px 1000px $bg inset !important;
    //   -webkit-text-fill-color: $cursor !important;
    // }
  }

  .el-form-item {
    border: 1px solid rgba(255, 255, 255, 0.1);
    background: rgba(255, 255, 255, 0.1);
    border-radius: 5px;
    color: #454545;
    // margin-bottom: 30px;
  }
}
</style>
<style lang="scss" scoped>
$bg: rgb(154, 184, 121);
$dark_gray: #889aa4;
$light_gray: #eee;

.login-container {
  min-height: 100%;
  width: 100%;
  background-color: $bg;
  overflow: hidden;

  .login-form {
    position: relative;
    width: 520px;
    max-width: 100%;
    padding: 160px 35px 0;
    margin: 0 auto;
    overflow: hidden;
  }

  .svg-container {
    padding: 6px 5px 6px 15px;
    color: $dark_gray;
    width: 30px;
    display: inline-block;
    vertical-align: middle;
  }

  .title-container {
    position: relative;

    .title {
      font-size: 26px;
      color: $light_gray;
      margin: 0px auto 40px auto;
      text-align: center;
      font-weight: bold;
    }
  }

  .show-pwd {
    position: absolute;
    right: 10px;
    top: 7px;
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
  }

  @media only screen and(max-width : 470px) {
  }
}
</style>
