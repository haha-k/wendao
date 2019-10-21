
<template>
  <div class="recommendedContent">
    <el-row class="bg-purple-dark">
      <el-col :span="5">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
      <el-col :span="14">
        <div class="grid-content bg-purple-dark">
          <el-tabs type="border-card">
            <el-tab-pane label="为你推荐">
              <!-- <el-card class="box-card" v-for="o in 9" :key="o" shadow="hover"> -->
              <div v-for="(v,i) in datas" :key="i">
                <Abbreviation :data="v"></Abbreviation>
              </div>
            </el-tab-pane>
            <el-tab-pane label="关注"></el-tab-pane>
            <el-tab-pane label="校园那些事儿"></el-tab-pane>
          </el-tabs>
        </div>
      </el-col>


      <el-col :span="5">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
    </el-row>

  </div>
</template>
<script>
export default {
  name: "recommendedContent",
  data() {
    return {
      datas: null,
      qid: "",
      aid: ""
    };
  },
  methods: {
    hhh() {},
    loadAll() {
      var url = "http://localhost:8000/api/question/all/";
      // this.$axios.get("/api/question").then(response => {
      this.$axios.get(url).then(response => {
        this.datas = response.data;
      });

      // return [
      //     {
      //         "qid":"1234",
      //         "question_content":"咱们学校补考算平时成绩吗？补考是考60就及格还是怎么？",
      //         "uid":"123456",
      //         "aid":"126",
      //         "answer_content":"算平时成绩,不一定的,看不同老师把"
      //     },
      //     {
      //         "qid":"123456",
      //         "question_content":"咱们学校，同一学期可以重修两门不同的英语么",
      //         "uid":"123456",
      //         "aid":"123456",
      //         "answer_content":"可以,如果那个学期同时开课就可以"
      //     },
      //       {
      //         "qid":"123456",
      //         "question_content":"咱们学校同同一学期可以重修两门不同的英语么咱们学校同同一学期可以重修两门不同的么？",
      //         "uid":"123456",
      //         "aid":"123456",
      //         "answer_content":"可以,如果那个学期同时开课就可以咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么"
      //     },
      //     {
      //         "qid":"123456",
      //         "question_content":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa?",
      //         "uid":"123456",
      //         "aid":"123456",
      //         "answer_content":"可以,如果那个学期同时开课就可以咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么"
      //     },
      //       {
      //         "qid":"123456",
      //         "question_content":"咱们学校同同一学期可以重修两门不同的英语么咱们学校同同一学期可以重修两门不同的么？",
      //         "uid":"123456",
      //         "aid":"123456",
      //         "answer_content":"可以,如果那个学期同时开课就可以咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么"
      //     },
      //     {
      //         "qid":"123456",
      //         "question_content":"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa?",
      //         "uid":"123456",
      //         "aid":"123456",
      //         "answer_content":"可以,如果那个学期同时开课就可以咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么咱们学校，同一学期可以重修两门不同的英语么"
      //     },
      // ]
    }
  },
  mounted() {
    // this.datas = this.loadAll();
    this.loadAll();
  },
  components: {
    Abbreviation
  }
};

import Abbreviation from "@/components/global/Abbreviation";
</script>
<style lang="scss" scoped>
$bg-purple-dark: #ffffff;
$bg-purple-light: rgb(255, 255, 255);
$minHeight: 2000px;
.recommendedContent {
}
.grid-content {
  // border-radius: 4px;
  min-height: $minHeight + 10;
}
.bg-purple-light {
  background: $bg-purple-light;
}
.bg-purple-dark {
  background: $bg-purple-dark;
}

.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}
</style>
