<template>
  <div class="topStory">
    <el-card>
      <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="推荐" name="first">
          <div class="Topstorycontent">
            <div class="Topstoryitem">
              <feedContent></feedContent>
              <feedFooter></feedFooter>
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
import feedContent from '@/components/global/feedContent'
import feedFooter from '@/components/global/feedFooter'
export default {
  name: "topStory",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {

  }
};
</script>
<style lang="scss" scoped>
.topStory {
}
</style>
