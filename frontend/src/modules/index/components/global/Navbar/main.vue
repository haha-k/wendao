<template>
  <div class="navbar">
    <div class="left-container">
      <el-menu
        :default-active="activeIndex"
        mode="horizontal"
        @select="handleSelect"
        :router="true"
      >
        <el-menu-item>
          <el-image class="image" style="width: 95px; height: 45px" src="/img/2.png" fit="fill"></el-image>
        </el-menu-item>
        <el-menu-item index="home" route="/home">首页</el-menu-item>
        <el-menu-item class="login" index="explore" route="/explore">发现</el-menu-item>
        <el-menu-item index="waiting" route="/waiting">等你来答</el-menu-item>
      </el-menu>
    </div>
    <Search></Search>
    <div class="right-container">
      <el-popover placement="bottom" width="360" trigger="click">
        <NotifyCard></NotifyCard>
        <el-badge slot="reference" :value="200" :max="99" class="item">
          <svg-icon class-name="icon" icon-class="notify-index" @click.stop="click" />
        </el-badge>
      </el-popover>
      <el-popover placement="bottom" width="360" trigger="click">
        <MessageCard></MessageCard>
        <el-badge slot="reference" :value="200" :max="99" class="item" size="mini">
          <svg-icon class-name="icon" icon-class="message-index" @click.stop="click"></svg-icon>
        </el-badge>
      </el-popover>
      <el-badge is-dot class="item1">
        <el-dropdown class="avatar-container right-menu-item hover-effort" placement="bottom">
          <div class="avatar-wrapper">
            <img src="/img/default.png" class="user-avatar" />
            <!-- <i class="el-icon-caret-bottom"></i> -->
          </div>
          <el-dropdown-menu slot="dropdown">
            <router-link to="/people/123">
              <el-dropdown-item icon="el-icon-user-solid">
                我的主页
                <el-badge class="mark" :value="3" is-dot />
              </el-dropdown-item>
            </router-link>
            <router-link to="/profile/index">
              <el-dropdown-item icon="el-icon-s-custom" divided>
                创作者中心
                <el-badge class="mark" :value="3" is-dot />
              </el-dropdown-item>
            </router-link>
            <router-link to="/profile/index">
              <el-dropdown-item icon="el-icon-s-tools" divided>
                设置
                <el-badge class="mark" :value="3" is-dot />
              </el-dropdown-item>
            </router-link>
            <el-dropdown-item divided icon="el-icon-switch-button">
              <span style="display:inline-block;" @click="logout">注销</span>
            </el-dropdown-item>
          </el-dropdown-menu>
        </el-dropdown>
      </el-badge>
    </div>
  </div>
</template>
<script>
import Search from "@/components/global/Search";
import MessageCard from "@/components/global/MessageCard";
import NotifyCard from "@/components/global/NotifyCard";

export default {
  name: "navbar",
  data() {
    return {
      activeIndex: "home",
      gridData: [
        {
          date: "2016-05-02",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄"
        }
      ]
    };
  },
  methods: {
    logout() {
      this.$router.push("/login");
    },
    handleSelect(key, keyPath) {
      //TODOconsole.log(key, keyPath);
    }
  },
  watch: {
    active: {
      handler: function(newVal, oldVal) {
        this.activeIndex = this.newVal;
      },
      deep: true
    }
  },
  mounted() {
    this.activeIndex = this.active;
  },
  components: {
    Search,
    MessageCard,
    NotifyCard
  },
  props: {
    active: String
  }
};
</script>

<style lang="scss" scoped>
@import "@/styles/variables.scss";

.navbar {
  margin: 0 auto;
  width: $screenWidth;
  // width: 100%;
  padding: 0 16px;
  height: $navbarHeight;
  overflow: hidden;
  position: relative;
  display: flex;
  flex-flow: row nowrap;
  justify-content: flex-start;
  align-items: center;

  .left-container {
    height: $navbarHeight;
    line-height: $navbarHeight;
    width: 400px;
    margin: 0 23px;
    text-align: left;

    .el-menu {
      border-bottom: none;
      height: $navbarHeight;
      line-height: $navbarHeight;
      .el-menu-item {
        font-size: 15px;
        font-weight: 600;
        color: #8590a6;
        height: $navbarHeight;
        line-height: $navbarHeight;

        a {
          height: 100%;
        }

        &.is-active {
          color: #444;
          border-bottom: 3px solid #409eff;
        }
      }
    }
  }

  .right-container {
    font-size: 20px !important;
    // width: ;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    flex: 1 1;

    // .icon {
    //   cursor: pointer;
    //   font-size: 100px;
    //   vertical-align: middle;
    // }

    .item {
      cursor: pointer;
      margin-right: 40px;
    }

    // .item1 {
    //   position: absolute;
    //   bottom: 3px;
    //   right: 3px;
    // }

    .avatar-container {
      position: relative;

      .user-avatar {
        cursor: pointer;
        width: 30px;
        height: 30px;
        border-radius: 10px;
      }

      .avatar-wrapper {
        margin-top: 5px;
      }
    }
  }
}
</style>
<style scoped>
.el-badge__content.is-dot {
  border: 2px solid #fff;
}

.el-dropdown-menu__item {
  font-size: 14px;
  font-weight: 600;
  color: #8590a6;
}
</style>
<style>
.el-popover {
  padding: 0 !important;
}
</style>

