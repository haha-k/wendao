<template>
  <div class="ColumnCard">
    <el-avatar :size="80" :src="column.image_url"></el-avatar>
    <router-link :to="`/column/${column.id}`" class="Name">{{column.title}}</router-link>
    <div class="count">
      <span>{{column.followers}}关注</span>
      <span>{{column.articles_count}}文章</span>
    </div>
    <div class="intro">{{column.intro}}</div>
    <el-button class="entry" @click="handlerEntry">进入专栏</el-button>
  </div>
</template>
<script>
export default {
  name: "ColumnCard",
  data() {
    return {};
  },
  methods: {
    handlerEntry() {
      this.$router.push(`/column/${column.id}/articles`);
    }
  },
  watch: {
    column: {
      handler: (newVal, oldVal) => {
        this.column = newVal;
        J;
      },
      deep: true
    }
  },
  props: {
    column: {
      type: Object
    }
  },
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.ColumnCard {
  display: flex;
  flex-direction: column;
  // justify-content: center;
  align-items: center;
  padding: 28px 24px;
  box-sizing: border-box;
  min-width: 230px;
  height: 313px;
  border-radius: 4px;
  box-shadow: 0 1px 3px 0 rgba(26, 26, 26, 0.1);
  background-color: #fff;
  flex: 1 1;

  & + & {
    margin-left: 20px;
  }

  .Name {
    margin-top: 20px;
    height: 22px;
    line-height: 22px;
    font-size: 16px;
    max-width: 187px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    font-weight: 600;
  }
  .count {
    margin-top: 4px;
    height: 17px;
    line-height: 17px;
    font-size: 12px;
    color: #999;

    span + span::before {
      content: "\B7";
      margin: 0 3px;
    }
  }
  .intro {
    margin-top: 20px;
    height: 40px;
    line-height: 20px;
    font-size: 14px;
    text-align: center;
    color: #444;
    display: -webkit-box;
    text-overflow: ellipsis;
    overflow: hidden;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
  }
  .entry {
    margin-top: 20px;
    padding: 0 16px;
    height: 34px;
    font-size: 14px;
    color: #0084ff;
    background-color: rgba(0, 132, 255, 0.08);
    border-radius: 3px;
    font-weight: 600;
  }
}
</style>
