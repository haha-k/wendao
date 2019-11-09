<template>
  <div class="Navbar">
    <hamburger
      id="hamburger-container"
      :is-active="sidebar.opened"
      class="hamburger-container"
      @toggleClick="toggleSideBar"
    ></hamburger>

    <!-- <breadcrumb id="breadcrumb-container" class="breadcrumb-container"></breadcrumb> -->

    <div class="right-menu">
      <template v-if="device!=='mobile'">
        <Search id="header-search" class="right-menu-item hover-effort"></Search>

        <!-- <error-log></error-log> -->
        <!-- <screenfull id="screenfull" class="right-menu-item hover-effect"></screenfull> -->

        <!-- <el-tooltip content="Global Size" effect="dark" placement="bottom">
          <size-select id="sezi-select" class="right-menu-item hover-effect" trigger="click"></size-select>
        </el-tooltip>-->
      </template>

      <el-dropdown class="avatar-container right-menu-item hover-effort">
        <div class="avatar-wrapper">
          <!-- <img src="avatar+'?imageView2/1/w/80/h/80'" class="user-avatar" /> -->
          <img src="https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg" class="user-avatar" />
          <!-- <img src="../../../public/img/default.png" class="user-avatar" /> -->
          <i class="el-icon-caret-bottom"></i>
        </div>
        <el-dropdown-menu slot="dropdown">
          <router-link to="/profile/index">
            <el-dropdown-item>个人主页</el-dropdown-item>
          </router-link>
          <!-- <a target="_blank" href="https://github.com/haha-k">
            <el-dropdown-item>github</el-dropdown-item>
          </a>-->
          <el-dropdown-item divided>
            <span style="display:block;" @click="logout">注销</span>
          </el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
    </div>
  </div>
</template>
<script>
import Hamburger from "@admin/components/global/Hamburger";
import { mapGetters } from "vuex";
import Search from "@admin/components/global/HeaderSearch";

export default {
  name: "Navbar",
  data() {
    return {};
  },
  methods: {
    logout(){
      console.log("logout");
      this.$store.dispatch('user/logout');
      this.$router.push(`/login?redirect=${this.$route.fullPath}`)
    },
    toggleSideBar(){
      console.log("toggleSidebar");
      this.$store.dispatch('app/toggleSideBar');
    }
  },
  mounted() {},
  components: {
    Search,
    Hamburger
  },
  computed: {
    ...mapGetters([
      'sidebar',
      'avatar',
      'device',
    ])
  }
};
</script>
<style lang="scss" scoped>
.Navbar {
  height: 50px;
  overflow: hidden;
  position: relative;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);

  .hamburger-container {
    line-height: 46px;
    height: 100%;
    float: left;
    cursor: pointer;
    transition: backgroud 0.3s;
    -webkit-tap-highlight-color: transparent;

    &:hover {
      background: rgba(0, 0, 0, 0.025);
    }
  }

  .breadcrumb-container {
    float: left;
  }

  .right-menu {
    float: right;
    height: 100%;
    line-height: 50px;

    &:focus {
      outline: none;
    }

    .right-menu-item {
      display: inline-block;
      padding: 0 8px;
      height: 100%;
      font-size: 18px;
      color: #5a5e66;
      vertical-align: text-bottom;

      &.hover-effect {
        cursor: pointer;
        transition: background 0.3s;

        &:hover {
          background: rgba(0, 0, 0, 0.025);
        }
      }
    }

    .avatar-container {
    margin-right: 30px;

    .avatar-wrapper {
      margin-top: 5px;
      position: relative;

      .user-avatar {
        cursor: pointer;
        width: 40px;
        height: 40px;
        border-radius: 10px;
      }

      .el-icon-caret-bottom {
        cursor: pointer;
        position: absolute;
        right: -20px;
        top:25px;
        font-size: 12px;
      }

    }
  }
  }


}
</style>
