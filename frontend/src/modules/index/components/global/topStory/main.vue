<template>
  <div class="topStory">
    <el-card>
      <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="推荐" name="first">
          <div class="Topstorycontent">
            <div class="Topstoryitem" v-for="(item,index) in recommendList" :key="index">
              <feedCard :item="item"></feedCard>
            </div>
          </div>
        </el-tab-pane>
        <el-tab-pane label="关注" name="second">关注</el-tab-pane>
        <el-tab-pane label="热榜" name="third">热榜</el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>
<script>
import feedCard from "@/components/global/feedCard";
import { getRecommend } from "#/api/home";

export default {
  name: "topStory",
  data() {
    return {
      recommendList: [],
      activeName: "first"
    };
  },
  computed: {},
  methods: {
    getRecommendList() {
      getRecommend()
        .then(result => {
          let { data } = result;
          this.recommendList = data.data;
        })
        .catch(err => {
          console.log(err);
        });
    },
    handleClick(tab, event) {
      //TODOconsole.log(tab, event);
    }
  },
  mounted() {
    this.getRecommendList();
  },
  components: {
    // feedContent: feedContent,
    // feedFooter: feedFooter,
    feedCard: feedCard
  }
};
</script>
<style lang="scss" scoped>
.topStory {
  flex-shrink: 0;
  margin-right: 10px;
  margin-bottom: 0;
  width: 694px;

  .el-tabs {
    font-size: 14px;
    font-weight: 600;
  }
}
</style>
