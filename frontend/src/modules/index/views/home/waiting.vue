<template>
  <div class="waiting">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'waiting'"></Navbar>
      </el-header>
      <el-main class="QuestionWaiting-container">
        <el-card class="mainColumn" :body-style="{ padding: '0px' }">
          <div slot="header" class="Sticky">
            <div class="types">
              <router-link to="/">
                <div class="type" :class="{'is-active':is_active}">
                  <i class="s"></i>
                  人气问题
                </div>
              </router-link>
              <router-link to="/">
                <div class="type">
                  <i class="s"></i>
                  潜力好问
                </div>
              </router-link>
              <router-link to="/">
                <div class="type">
                  <i class="s"></i>
                  新问题
                </div>
              </router-link>
              <router-link to="/">
                <div class="type">
                  <i class="s"></i>
                  人人答
                </div>
              </router-link>
            </div>
          </div>
          <div class="questions">
            <questionWaiting-card v-for="i in 10" :key="i"></questionWaiting-card>
          </div>
        </el-card>
        <globalSidebar></globalSidebar>
      </el-main>
      <div></div>
    </el-container>
  </div>
</template>
<script>
import Navbar from "@/components/global/Navbar";
import globalSidebar from "@/components/global/globalSidebar";
export default {
  name: "waiting",
  data() {
    return {
      is_active: true
    };
  },
  methods: {},
  mounted() {},
  components: {
    Navbar: Navbar,
    globalSidebar: globalSidebar
  }
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";
</style>
<style lang="scss" scoped>
.waiting {
  .QuestionWaiting-container {
    display: flex;
    margin: 10px auto;
    width: 1000px;
    .mainColumn {
      margin-right: 10px;
      width: 694px;
      align-self: flex-start;

      .types {
        align-items: center;
        background: #fff;
        border-bottom: 1px solid #f6f6f6;
        border-radius: 2px 2px 0 0;
        display: flex;
        height: 68px;
        padding: 0 10px;

        .type {
          margin: 0 10px;
          display: flex;
          font-size: 14px;
          padding: 0 12px;
          height: 32px;
          cursor: pointer;
          border-radius: 16px;
          align-items: center;
          background: rgba(133,144,166,.12);
          color: #444;

          &.is-active {
            background: rgba(0, 132, 255, 0.08);
            box-shadow: 0 6px 10px 0 rgba(0, 132, 255, 0.06);
            color: #0084ff;
            font-weight: 500;
          }
        }
      }

      .questions {
        padding: 0 20px;
      }
    }
  }
}
</style>
