<template>
  <el-card class="column-header" :body-style="{ padding: '0px' }">
    <!-- <div slot="header"></div> -->
    <div class="inner">
      <h1 class="title">{{ "java快速进阶通道" }}</h1>
      <p class="desc">专注xxxx</p>
      <div class="about">
        {{ "xxx-xxx-xxx-关于专栏" }}
      </div>
      <el-button class="voters">{{ "234人关注" }}</el-button>
      <el-image
        class="image"
        src="https://pic2.zhimg.com/v2-591e38683b2102e630808377dcc4a257_t.jpg"
      ></el-image>
      <div class="buttonGroup">
        <el-button
          @click="handlerFollow"
          :class="{ 'is-active': followStatus }"
        >
          {{ followStatus == true ? "已关注" : "关注专栏" }}
        </el-button>
        <el-button @click="handlerCreate">投稿</el-button>
        <el-button @click="handlerReport" class="el-icon-thirdjubao2"
          >举报</el-button
        >
      </div>
    </div>
  </el-card>
</template>
<script>
export default {
  name: "ColumnHeader",
  data() {
    return {
      followStatus: false
    };
  },
  methods: {
    handlerFollow() {
      this.followStatus = !this.followStatus;
    }
  },
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.column-header {
  background-color: #fff;
  color: #1a1a1a;
  padding: 20px 0 16px;
  width: 100%;
  box-sizing: border-box;

  .inner {
    box-sizing: border-box;
    padding-right: 140px;
    position: relative;
    width: 690px;
    margin: 0 auto;
    min-height: 124px;
    text-align: left;

    .title {
      font-weight: 600;
      font-size: 26px;
      line-height: 1.4;
      margin: 0;
      text-align: left;
    }

    .desc {
      margin: 8px 0;
      font-size: 17px;
      line-height: 1.4;
      color: #444;
    }

    .about {
      color: #8590a6;
      margin: 8px 0;
      font-size: 15px;
      line-height: 1.4;
    }

    .voters {
      color: #8590a6;
      padding: 0;
      border: none;
      background-color: transparent;
    }

    .image {
      position: absolute;
      top: 0;
      right: 0;
      width: 124px;
      height: 124px;
      border-radius: 50%;
    }
    .buttonGroup {
      margin-top: 12px;

      .el-button {
        &:first-child {
          margin-right: 16px;
          background-color: #0084ff;
          color: #fff;

          &.is-active {
            color: #fff;
            background-color: #8590a6;
          }
        }

        &:nth-child(2) {
          margin-right: 16px;
          margin-left: 0;
          color: #0084ff;
          border-color: #0084ff;
        }

        &:nth-child(3) {
          margin-right: 16px;
          margin-left: 0;
          background-color: transparent;
          border: none;
          padding: 0;
        }
      }
    }
  }
}
</style>
