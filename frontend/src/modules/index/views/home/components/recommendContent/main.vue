<template>
  <div class="recommendContent">
    <div
      class="Topstoryitem"
      v-for="(item, index) in recommendList"
      :key="index"
    >
      <feedCard :item="item"></feedCard>
    </div>
  </div>
</template>
<script>
export default {
  name: "recommendContent",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {
    // feedContent: feedContent,
    // feedFooter: feedFooter,
    // feedCard: feedCard
  },
  props: ["recommendList"]
};
</script>
<style lang="scss" scoped>
.recommendContent {
}
</style>
