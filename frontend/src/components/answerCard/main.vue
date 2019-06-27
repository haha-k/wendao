<template>
  <div class="answerCard">
    <el-row class="bg-purple-dark">
      <el-col :span="6">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
      <el-col :span="12">
        <div class="grid-content bg-purple-dark">
          <el-card>
            <!-- <answerHeader></answerHeader> -->
            <div>{{user_name+":"}}</div>
            <div>{{likes+"人赞同了该回答"}}</div>
            <el-divider></el-divider>
            <div class="mainContent">
              {{content}}
            </div>
            <el-divider></el-divider>
            <qfooter :data="datas"></qfooter>
          </el-card>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import answerHeader from "@/components/answerHeader";
import qfooter from "@/components/global/qfooter";
export default {
  name: "answerCard",
  data() {
    return {
      user_name: "haha",
      likes: 0,
      content:`暂无答案`,
      uid:"",
      comment:0,
      datas:{
        "like_count":0,
        "aComment":0,
      }
    };
  },
  props: ["data"],
  methods: {},
  mounted() {
    console.log(this.data);
    this.likes = this.data["like_count"];
    this.uid = this.data["uid"];
    this.content = this.data["answer_content"];
    this.comment = this.data["comment_count"];
    var url = "http://localhost:8000/api/account/uid/"+this.uid;
    this.datas["like_count"]=this.likes;
    this.datas["aComment"]=this.comment;

    // collect = this.data["like_count"];
    this.$axios.get(url).then((result) => {
      if(result.data["nickname"]==null){
        this.user_name="用户"+result.data["id"];
      }else{
        this.user_name=result.data["nickname"]
      }
    }).catch((err) => {

    });


  },
  components: {
    "answerHeader": answerHeader,
    "qfooter": qfooter,

  }
};
</script>
<style lang="scss" scoped>
$bg-purple-dark: rgb(255, 255, 255);
$bg-purple-light: rgb(255, 255, 255);
$minHeight: 60px;
.answerCard {
  .grid-content {
    // border-radius: 4px;
    min-height: $minHeight + 10;
    .el-card {
      margin-bottom: 20px;
      div {
        margin-top: 10px;
        // margin-right:400px;
        font-size: 22px;
        font-weight: 400;
        text-align: left;
        &:nth-child(2) {
          font-size: 18px;
          font-weight: 400;
          margin-top: 20px;
          color: rgb(118, 147, 197);
          // margin-bottom: 20px;
        }
        .mainContent{
          margin-top: 20px;
          font-size: 18px;
           color:#1a1a1a;
        }
      }
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
