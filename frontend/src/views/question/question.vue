
<template>
  <div class="question">
    <Header class="qc"></Header>
    <questionCard @visable="vis" :qid="qid" class="qc"></questionCard>
    <!-- <el-card v-if="visables"> -->

    <reply v-if="visables" :qids="qid"></reply>
    <!-- </el-card> -->

    <el-card>
      <answerCard v-for="(v,i) in datas" :key="i" :data="v"></answerCard>
      <el-divider></el-divider>
      <div v-if="n">
        暂无回答,
        <el-link>添加回答</el-link>
      </div>
    </el-card>
  </div>
</template>
<script>
import Header from "@/components/global/Header";
import questionCard from "@/components/questionCard";
import answerCard from "@/components/answerCard";
import reply from "@/components/reply";
export default {
  name: "question",
  data() {
    return {
      qid: "1",
      aid: "",
      datas: [],
      visables: false,
      n: false
    };
  },
  methods: {
    vis: function(visable) {
      console.log(visable);
      this.visables = visable;
    },
    loadAll() {}
  },
  components: {
    Header: Header,
    questionCard: questionCard,
    answerCard: answerCard,
    reply: reply
  },
  mounted() {
    this.qid = this.$route.params.qid;
    // this.aid = this.$route.params.aid;
    // console.log(this.qid+" "+this.aid);
    var url = "http://localhost:8000/api/answer/qid/" + this.qid;
    this.$axios
      .get(url)
      .then(result => {
        this.datas = result.data;
        if(result.data.length==0){
          this.n = true;
        }
        console.log(result.data);
      })
      .catch(err => {
        console.log(err);
      });
    // console.log(this.datas);
    // if (this.datas.length==0) {
    //   this.n = true;
    // }
  }
};
</script>
<style lang="scss" scoped>
.question {
  .qc {
    box-shadow: 0 1px 3px rgba(26, 26, 26, 0.1);
  }
}
</style>
