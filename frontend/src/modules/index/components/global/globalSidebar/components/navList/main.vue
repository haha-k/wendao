
<template>
  <div class="navList-container">
    <el-card>
      <div class="navList">
        <div class="StarItem">
          <router-link to="/people/123" target="_blank" class="GlobalSideBar-navLink">
          <!-- <router-link to="/" target="_blank" class="GlobalSideBar-navLink"> -->
            <i class="el-icon-thirdshoucang1"></i>
            <span class="GlobalSideBar-navText">我的收藏</span>
            <span class="GlobalSideBar-navNumber">{{StarCount}}</span>
          </router-link>
        </div>
        <div class="questionListItem">
          <router-link to="/people/123" target="_blank" class="GlobalSideBar-navLink">
            <i class="el-icon-thirdshoucang1"></i>
            <span class="GlobalSideBar-navText">我关注的问题</span>
            <span class="GlobalSideBar-navNumber">{{questionListCount}}</span>
          </router-link>
        </div>
        <div class="inviteItem">
          <router-link to="/people/123" target="_blank" class="GlobalSideBar-navLink">
            <i class="el-icon-thirdshoucang1"></i>
            <span class="GlobalSideBar-navText">我的邀请</span>
            <span class="GlobalSideBar-navNumber">{{inviteCount}}</span>
          </router-link>
        </div>
        <div class="serviceItem">
          <router-link to="/people/123" target="_blank" class="GlobalSideBar-navLink">
            <i class="el-icon-thirdshoucang1"></i>
            <span class="GlobalSideBar-navText">站务中心</span>
          </router-link>
        </div>
        <div class="copyrightItem">
          <router-link to="/people/123" target="_blank" class="GlobalSideBar-navLink">
            <i class="el-icon-thirdshoucang1"></i>
            <span class="GlobalSideBar-navText">版权服务中心</span>
          </router-link>
        </div>
      </div>
    </el-card>
  </div>
</template>
<script>
export default {
  name: "navList",
  data() {
    return {
      StarCount: 0,
      questionListCount: 6,
      inviteCount: 15
    };
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";
.navList-container {
  .el-card {
    width: 296px;
    .navList {
      width: 100%;
      padding: 8px 0;

      color: #8590a6;
      font-size: 14px;
      // cursor: pointer;
      font-weight: 600;
    }
  }
}
</style>
<style scoped>
.navList-container >>> .el-card__body {
  padding: 0 !important;
}
</style>