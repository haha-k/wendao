
<template>
  <div class="answers">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'home'"></Navbar>J
      </el-header>
      <main style="margin-top:52px">
        <div class="question-page">
          <question-header :question="question" ref="qHeader"></question-header>
          <question-main
            :isAll="true"
            :isFixed="isFixed"
            :mainAnswer="mainAnswer"
            :otherAnswer="otherAnswer"
            :ac="answerCount"
          ></question-main>
        </div>
      </main>
    </el-container>
  </div>
</template>
<script>
export default {
  name: "answers",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.answers {
}
</style>
