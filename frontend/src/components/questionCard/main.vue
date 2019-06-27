
<template>
  <div class="questionCard">
    <el-row class="bg-purple-dark">
      <el-col :span="6">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
      <el-col :span="12">
        <div class="grid-content bg-purple-dark">
          <el-tag v-for="i in 5" :key="i">分类{{i}}</el-tag>
          <div class="qt">{{question_title}}</div>
          <el-collapse v-model="activeName" accordion>
            <el-collapse-item :title="title" name="1">
              <div>{{describe}}</div>
            </el-collapse-item>
          </el-collapse>

          <el-button type="primary">关注问题</el-button>
          <el-button plain icon="el-icon-search" @click="write">写回答</el-button>
          <el-button plain icon="el-icon-search">邀请回答</el-button>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  name: "questionCard",
  data() {
    return {
      qid: "",
      aid: "",
      question_title: "",
      title: "显示描述",
      describe: "无",
      visable:true
    };
  },
  methods: {
    write:function(){
      console.log("===========");
        this.$emit("visable",true);
    },
    getdes() {}
  },
  mounted() {
    this.qid = this.$route.params.qid;
    // console.log
    var url = "http://localhost:8000/api/question/qid/"+this.qid;
    this.$axios.get(url).then((result) => {
        this.question_title=result.data[0]["question_content"];
        this.describe=result.data[0]["question_describe"];
    }).catch((err) => {
        console.log(err);
    });
  },
  components: {}
};
</script>
<style lang="scss" scoped>
$bg-purple-dark: #fff;
$bg-purple-light: rgb(255, 255, 255);
$minHeight: 60px;
.questionCard {
  .grid-content {
    // border-radius: 4px;
    min-height: $minHeight + 10;
    .el-tag {
      margin-left: 20px;
      position: relative;
      left: -300px;
      margin-top: 30px;
      &:nth-child(1) {
        margin-left: 0px;
      }
    }
    .qt {
      margin-top: 30px;
      // margin-right:400px;
      font-size: 22px;
      font-weight: 600;
      text-align: left;
      // margin-left: 30px;
    }
    .el-collapse {
      margin-top: 20px;
      margin-bottom: 30px;
      text-align: center;
      .el-collapse-item {
        font-size: 16px;
        font-weight: 300;
        text-align: center;
      }
    }
    .el-button {
      position: relative;
      left: -300px;
      margin-bottom: 30px;
    }
  }
  .bg-purple-light {
    background: $bg-purple-light;
  }
  .bg-purple-dark {
    background: $bg-purple-dark;
  }
}
</style>
