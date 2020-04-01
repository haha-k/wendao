<template>
  <div class="questionMain-container">
    <div class="ListShortcut">
      <div class="question-mainColumn">
        <view-all-card :answerCount="answerCount"></view-all-card>
        <answer-card :answer="answer"></answer-card>
        <more-answers-card :otherAnswer="otherAnswer"></more-answers-card>
        <view-all-card :answerCount="answerCount"></view-all-card>
      </div>
    </div>
    <div class="side-column" :class="{'is-fixed':isFixed}" ref="side">
      <div class="Sticky">
        <author-card :uid="author.id" :name="author.name"></author-card>
        <answer-favlisat-card></answer-favlisat-card>
        <related-question-card></related-question-card>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "questionMain",
  data() {
    return {
      answerCount: this.ac,
      answer: {},
      loadding: false,
      otherAnswer: [],
      author: {}
    };
  },
  methods: {},
  mounted() {
    console.warn(this.isFixed);
  },
  destroyed() {},
  components: {},
  props: {
    ac: Number,
    mainAnswer: Object,
    otherAnswer: Array,
    isFixed: {
      type: Boolean,
      default: false
    }
  },
  watch: {
    ac: {
      handler(newVal, oldVal) {
        this.answerCount = newVal;
      },
      deep: true,
      immediate: true
    },
    mainAnswer: {
      handler(newVal, oldVal) {
        this.answer = newVal;
        this.author = this.answer.author;
        // console.log("xxxxx");
        // console.log(this.answer);
      },
      deep: true,
      immediate: true
    },
    otherAnswer: {
      handler(newVal, oldVal) {
        this.otherAnswer = newVal;
      },
      deep: true,
      immediate: true
    },
    isFixed: {
      handler(newVal, oldVal) {
        this.isFixed = newVal;
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.questionMain-container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin: 10px auto;
  padding: 0 16px;
  width: 1000px;
  min-height: 100vh;

  .question-mainColumn {
    width: 694px;
    padding-bottom: 20px;
  }

  .side-column {
    width: 296px;

    &.is-fixed {
      position: fixed;
      top: 62px;
      transform: translateX(704px);
    }
  }
}
</style>
