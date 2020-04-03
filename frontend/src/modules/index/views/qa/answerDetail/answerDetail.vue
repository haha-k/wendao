<template>
  <div class="answerDetail-container">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'home'"></Navbar>
      </el-header>
      <main style="margin-top:52px">
        <div class="question-page">
          <question-header :question="question" ref="qHeader"></question-header>
          <question-main
            :isAll="aid === undefined"
            :isFixed="isFixed"
            :mainAnswer="mainAnswer"
            :otherAnswer="otherAnswer"
            :ac="answerCount"
            :qid="qid"
          ></question-main>
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
      otherAnswer: [],
      isFixed: false
    };
  },
  methods: {
    handleScroll() {
      let el = this.$refs.qHeader.$el;
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      this.isFixed = scrollTop >= el.offsetHeight;
    },
    getQuestion(id) {
      getQuestionDetail(id)
        .then(result => {
          let { data } = result;
          this.question = data;
          this.answerCount = this.question.answer_count;
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
    window.addEventListener("scroll", this.handleScroll);
    this.getAnswer(this.mainAnswerId);
    this.getQuestion(this.questionId);
  },
  destroyed() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  components: {
    "question-main": questionMain,
    Navbar: Navbar
  },
  props: ["qid", "aid"]
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";

.answerDetail-container {
}
</style>
