<template>
  <div class="column">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'home'"></Navbar>
      </el-header>
      <main class="App-main">
        <div class="home">
          <div class="home-top">
            <h2 class="sub-title">
              随心写作,自由表达
            </h2>
            <el-button class="write-button" @click="handlerWrite">开始写文章</el-button>
            <el-button class="apply-button">申请开通专栏 ></el-button>
          </div>
          <div class="home-recommendation">
            <h3 class="title">专栏 · 发现</h3>
            <!-- <div class="line"></div> -->
            <div class="card-container">
              <!-- <el-card v-for="i in 8" :key="i"> -->
                <router-link to="/column/123" v-for="i in 8" :key="i">
                  <el-image
                    :size="48"
                    src="https://pic3.zhimg.com/8138eae6469a7c8c93497b45ad41e28e_xs.jpg"
                    alt="专栏图像"
                  />
                  <div class="info">
                    <div class="title">
                      7号汽车
                    </div>
                    <div class="description">
                      愿你我都能在这里看到更广阔的世界
                    </div>
                  </div>
                  <div class="meta">
                    930人关注 |266篇文章
                  </div>
                  <el-button class="follow-button">进入专栏</el-button>
                </router-link>
              <!-- </el-card> -->
            </div>
            <el-button class="refresh-button">
              换一换
            </el-button>
          </div>
          <div class="home-bottom">
            <el-button>申请专栏</el-button>
          </div>
        </div>
      </main>
      <div></div>
    </el-container>
  </div>
</template>
<script>
import Navbar from "@/components/global/Navbar";
export default {
  name: "column-home",
  data() {
    return {};
  },
  methods: {
    handlerWrite(){
      this.$router.push("/write")
    }
  },
  mounted() {},
  components: {
    Navbar: Navbar
  }
};
</script>
<style lang="scss" scoped>
.column {
  .App-main {
    padding-bottom: 46px;
    // margin: 0;
    // padding: 0;
    // width: 100%;
    // flex-direction: column;

    .home-top {
      background: url(https://static.zhihu.com/heifetz/assets/patterns.c72a480c.png)
        50% no-repeat;
      height: 470px;
      position: relative;

      .sub-title {
        color: #1a1a1a;
        font-size: 18px;
        font-weight: 300;
        letter-spacing: 0.5em;
        line-height: 24px;
        margin: 0;
        position: absolute;
        text-align: center;
        top: 350px;
        width: 100%;
      }

      .write-button {
        padding: 0;
        border-color: #444;
        box-sizing: border-box;
        color: #444;
        height: 38px;
        left: 50%;
        line-height: 36px;
        margin-left: -51px;
        position: absolute;
        top: 413px;
        width: 120px;
      }

      .apply-button {
        background-color: transparent;
        border: none;
        color: #11a668;
        padding: 0;
        font-size: 14px;
        left: 50%;
        line-height: 12px;
        margin-left: -36px;
        position: absolute;
        top: 466px;
      }
    }

    .home-recommendation {
      display: flex;
      flex-direction: column;
      align-items: center;
      margin: 48px auto 0;
      width: 888px;

      .title {
        align-items: center;
        display: flex;
        justify-content: center;
        margin: 0 3px 32px;
        width: 100%;
        // color: #1a1a1a;
        // font-size: 14px;
        line-height: 22px;
        margin: 0 16px;
        font-weight: 600;
      }

      .card-container {
        display: flex;
        flex-wrap: wrap;

        a {
          margin: 0 8px 16px;
          align-items: center;
          background: #fff;
          border-radius: 4px;
          box-shadow: 0 8px 18px rgba(0, 0, 0, 0.06);
          box-sizing: border-box;
          display: flex;
          flex-direction: column;
          padding: 26px 0 23px;
          width: 206px;
          .el-image__inner {
            border-radius: 50%;
          }
          .info {
            display: flex;
            align-items: center;
            flex-direction: column;
            flex-grow: 1;
            padding: 0 16px;

            .title {
              margin-top: 16px;
              text-overflow: ellipsis;
              overflow: hidden;
              font-weight: 600;

              .description {
                color: grey;
                font-size: 14px;
                line-height: 21px;
                margin-top: 7px;
                text-align: center;
                word-break: break-all;
                display: -webkit-box;
                text-overflow: ellipsis;
                overflow: hidden;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
              }
            }
          }
          .meta {
            color: grey;
            font-size: 14px;
            margin-top: 14px;
          }
          .follow-button {
            margin-top: 15px;
            flex-shrink: 0;
          }
        }
      }
    }
  }
}
</style>
<style scoped>
.card-container >>> .el-card__body {
  padding: 0 !important;
}
</style>
