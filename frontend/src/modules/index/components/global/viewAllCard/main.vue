
<template>
  <div class="viewAllCard">
    <el-card>
      <el-link :underline="false" :href="url">查看全部{{answerCount}}个回答</el-link>
    </el-card>
  </div>
</template>
<script>
export default {
  name: "viewAllCard",
  data() {
    return {
      answerCount: this.answerCount,
      url: "/question/" + this.$route.params.qid + "/answers"
    };
  },
  methods: {},
  mounted() {},
  components: {},
  props: {
    answerCount: Number
  }
};
</script>
<style lang="scss" scoped>
.viewAllCard {
  .el-card {
    margin-bottom: 10px;
    background: #fff;
    border-radius: 2px;
    box-shadow: 0 1px 3px rgba(26, 26, 26, 0.1);
    box-sizing: border-box;

    .el-link {
      display: block;
      line-height: 50px;
      color: #8590a6;
      text-align: center;
      text-decoration: none;
      font-weight: 600;
      font-size: 15px;

      &:hover {
        color: #175199;
      }
    }
  }
}
</style>
<style scoped>
.viewAllCard >>> .el-card__body {
  padding: 0 !important;
  /* padding:0 20px !important; */
}
</style>
