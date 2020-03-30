
<template>
  <div class="writeCard-container">
    <el-card>
      <div class="GlobalWrite-nav">
        <router-link target="_blank" class="GlobalWrite-navItem" to="/write">
          <!-- <svg-icon></svg-icon> -->
          <i class="el-icon-thirdwenjian"></i>
          <div class="GlobalWrite-navTitle">写回答</div>
        </router-link>
        <router-link target="_blank" class="GlobalWrite-navItem" to="/write">
          <!-- <svg-icon></svg-icon> -->
          <i class="el-icon-thirdxie1"></i>
          <div class="GlobalWrite-navTitle">写文章</div>
        </router-link>
        <router-link target="_blank" class="GlobalWrite-navItem" to="/column/">
          <i class="el-icon-thirdxie1"></i>
          <div class="GlobalWrite-navTitle">建专栏</div>
        </router-link>
      </div>
      <div class="GlobalWriteAnswerLater">
        <router-link to="/question/later" target="_blank" class="GlobalSideBar-navLink">
          <div class="GlobalWriterAnswerLater-text">
            <i class="el-icon-thirdlishi1"></i>
            <div class="GlobalSideBar-navText">我的稍后答</div>
          </div>
          <div v-if="AnswerLaterNum" class="GlobalSideBar-navNumber">{{AnswerLaterNum}}</div>
        </router-link>
      </div>
      <!-- <el-divider></el-divider> -->
      <div class="GlobalWritedraft">
        <router-link to="/" target="_blank" class="GlobalSideBar-navLink">
          <i class="el-icon-thirdcaogaoxiang"></i>
          <div class="GlobalSideBar-navText">我的草稿</div>
          <div v-if="draftNum" class="GlobalWrite-navNumber">{{draftNum}}</div>
        </router-link>
      </div>
    </el-card>
  </div>
</template>
<script>
export default {
  name: "writeCard",
  data() {
    return {
      draftNum: 0,
      AnswerLaterNum: 1
    };
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";
.writeCard-container {
  width: 296px;

  .el-card {
    width: 296px;
    // width: 100%;
    margin-bottom: 10px;
  }

  .GlobalWrite-nav {
    display: flex;
    justify-content: center;
    .GlobalWrite-navItem {
      display: flex;
      justify-content: center;
      cursor: pointer;
      margin: 23px;
      position: relative;
      align-items: center;
      flex-direction: column;
      // font-size:24px;

      i {
        color: #8590a6;
        margin-bottom: 6px;
      }

      .GlobalWrite-navTitle {
        color: #444;
        font-size: 16px;
        font-weight: 600;

        &:hover {
          color: rgb(23, 81, 153);
        }
      }
    }
  }

  .GlobalWriteAnswerLater {
    display: flex;
    height: 48px;
    margin: 0 20px;
    position: relative;
    color: #8590a6;
    align-items: center;
    font-weight: 600;

    a:hover {
      background-color: #f6f6f6;
    }
    .GlobalSideBar-navLink {
      margin: 0 -20px;
      width: 100%;

      .GlobalWriterAnswerLater-text {
        display: flex;
        margin-right: auto;
        align-items: center;
        .GlobalSideBar-navText {
          margin-left: 8px;
        }
      }
    }
  }

  .GlobalWritedraft {
    display: flex;
    height: 48px;
    margin: 0 20px;
    align-items: center;
    color: #8590a6;
    font-weight: 600;
    border-top: 1px solid #f0f2f7;

    .GlobalSideBar-navLink {
      margin: 0 -20px;
      width: 100%;
      .GlobalSideBar-navText {
      }

      .GlobalWrite-navNumber {
      }
    }
  }
}
</style>
<style scoped>
.el-divider--horizontal {
  margin: 0 !important;
}
.writeCard-container >>> .el-card__body {
  padding: 0 !important;
}
</style>
