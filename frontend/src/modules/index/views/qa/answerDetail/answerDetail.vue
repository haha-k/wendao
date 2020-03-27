<template>
  <div class="answerDetail-container">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'home'"></Navbar>
      </el-header>
      <main>
        <div class="question-page">
          <question-header :question="question"></question-header>
          <question-main :mainAnswer="mainAnswer" :otherAnswer="otherAnswer" :ac="answerCount"></question-main>
        </div>
      </main>
    </el-container>
  </div>
</template>
<script>
import { getAnswerDetail } from "#/api/answer";
import { getQuestionDetail } from "#/api/question";
import questionMain from "./components/questionMain";
import Navbar from "@/components/global/Navbar";

export default {
  name: "answerDetail",
  data() {
    return {
      mainAnswerId: this.$route.params.aid,
      questionId: this.$route.params.qid,
      question: {},
      answerCount: 0,
      answer: {},
      mainAnswer: {},
      otherAnswer: []
    };
  },
  methods: {
    getQuestion(id) {
      getQuestionDetail(id)
        .then(result => {
          let { data } = result;
          this.question = data;
          this.answerCount = this.question.answer_count;
          console.log(this.answerCount);
        })
        .catch(err => {
          console.log(err);
        });
    },
    getAnswer(id) {
      getAnswerDetail(id)
        .then(result => {
          let { data } = result.data;
          this.answer = data;
          for (let item of this.answer) {
            if (String(item.id) === this.mainAnswerId) {
              this.mainAnswer = item;
            } else {
              this.otherAnswer.push(item);
            }
          }
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mounted() {
    this.getAnswer(this.mainAnswerId);
    this.getQuestion(this.questionId);
  },
  components: {
    "question-main": questionMain,
    Navbar: Navbar
  },
  props: {}
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";

.answerDetail-container {
}
</style>
