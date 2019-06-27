<template>
  <div class="header">
    <el-row :gutter="20">
      <el-col :span="5">
        <div class="grid-content bg-purple"></div>
      </el-col>
      <el-col :span="3">
        <el-menu
          :default-active="activeIndex2"
          class="el-menu-demo"
          mode="horizontal"
          @select="handleSelect"
          background-color="#fff"
          text-color="#000"
          active-text-color="#ffd04b"
          router="true"
        >
          <el-menu-item index="/home">首页</el-menu-item>
          <el-menu-item class="login" index="/login">发现</el-menu-item>
          <!-- <el-menu-item index="/login">|</el-menu-item> -->
          <el-menu-item index="/register">话题</el-menu-item>
        </el-menu>
      </el-col>
      <el-col :span="8">
        <div class="grid-content bg-purple">
          <!-- <Search></Search> -->
        </div>
      </el-col>
      <el-col :span="4">
        <div class="grid-content bg-purple" v-if="is_login">
          <el-link icon="el-icon-bell" underline="false">
            通知
            <el-badge :value="1" :max="99" class="item"></el-badge>
          </el-link>

          <el-link icon="el-icon-chat-round">
            私信
            <el-badge :value="2" :max="99" class="item"></el-badge>
          </el-link>
          <el-dropdown placement="bottom" @command="handleCommand">
            <span class="el-dropdown-link">
              <!-- <el-image style="width: 2px; height: 2px" :src="url" :fit="fill"></el-image> -->
              <i class="el-icon-arrow-down el-icon--right"></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item icon="el-icon-user">个人中心</el-dropdown-item>
              <el-dropdown-item icon="el-icon-setting">设置</el-dropdown-item>
              <el-dropdown-item icon="el-icon-switch-button" command="exit">退出</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <!-- <i class="el-icon-bell"></i>
          <i class="el-icon-chat-round"></i>-->
        </div>
        <div class="grid-content bg-purple" v-else>
          <el-button @click="login">登录</el-button>
          <el-button @click="register">加入问道</el-button>
        </div>
      </el-col>
      <el-col :span="4">
        <div class="grid-content bg-purple"></div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import { NavMenu } from "element-ui";
import Search from "@/components/Search";
// import { Button, Select } from 'element-ui';
export default {
  name: "Header",
  data() {
    return {
      is_login: false,
      url:
        "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg"
    };
  },
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    handleCommand(command) {
      // this.$message("click on item " + command);
      if(command == "exit"){
          this.exit();
      }
    },
    login: function() {
      location.href = "/#/login";
    },
    register: function() {
      location.href = "/#/register";
    },
    exit: function() {
      this.is_login = false;
      localStorage.clear();
      console.log("///////////////////");
      console.log(this.is_login);
      this.$router.push("/login");
    }
  },
  components: {
    Search: "Search"
  },
  mounted() {
    console.log(localStorage.getItem("is_login"));
    console.log("----------==============");
    console.log(localStorage.getItem("username"));

    // console.log(cookie.getCookie('is_login'));

    this.is_login = localStorage.getItem("is_login");
    // var url = ''
    // this.$axios.get(url).then(response =>{
    //   var res = response.data;
    //   console.log(res);
    // })
    // this.is_login =
    // console.log(cookie.getCookie('username'));
    // this.is_login=
  }
};
</script>
<style lang="scss" scoped>
$purple: #fff;
// $purple: #d3dce6;
.header {
  .el-menu {
    // padding: 0;
    // margin:0;\

    // &:nth-of-type(0) {
    //   // position: relative;
    //   // left: 30px;
    //   // top:20px
    //   color: #1d4fc3;
    //   background-color: rgb(138, 11, 11);
    // }

    .login {
      text-align: right;
      color: #1d4fc3;
      background-color: rgb(138, 11, 11);
    }
  }
  .el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
  }
  .el-col {
    border-radius: 4px;
  }

  .bg-purple {
    background: $purple;
  }

  .grid-content {
    border-radius: 4px;
    min-height: 36px;
    .el-link,
    .el-dropdown {
      margin-left: 20px;
    }
  }
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }
}
</style>
// login({ username:this.userName, //当前页码 password:this.parseWord })
// .then((response)=> { console.log(response);
// //本地存储用户信息
// cookie.setCookie('name',this.userName,7);
// cookie.setCookie('token',response.data.token,7) //存储在store
// // 更新store数据
// that.$store.dispatch('setInfo');
//  //跳转到首页页面
//  this.$router.push({ name: 'index'}) })