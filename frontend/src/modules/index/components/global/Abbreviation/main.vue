<template>
  <!-- <div class="Abbreviation"> -->
  <el-card class="box-card" shadow="hover">
    <div slot="header" class="clearfix">
      <router-link :to="setq">{{data.question_content}}</router-link>
      <router-view></router-view>
      <el-button style="float: right; padding: 3px 0" type="text">
        <i class="el-icon-close"></i>
      </el-button>
    </div>
    <div class="qc">{{data.answer_content}}</div>
    <el-divider></el-divider>
    <qfooter></qfooter>
  </el-card>
  <!-- </div> -->
</template>
<script>
import qfooter from "@/components/global/qfooter"
export default {
  name: "Abbreviation",
  props:["data"],
  data(){
    return{
        data:null,
         setq:{
          name: 'question1',
          // path:'' ,
          params: {
            qid: this.data.qid,
            // aid: this.data.aid,
          }
      }
    }
  },
  method(){

  },
  mounted(){
    // console.log(this.data);
  },
  components: {
    "qfooter":qfooter,
  }
};
</script>
<style lang="scss" scoped>
.Abbreviation {
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both;
}
.box-card {
  width: auto;
  margin: 5px;
  router-link {
    display: block;
    // width: 150px;
    float: left;
    font-size: 22px;
    // text-align: left;

  }
  .qc{
      text-align: left;
      color: #1a1a1a;
      line-height: 40px;

    }
  a {
    text-decoration: none;
    float: left;
    font-size: 22px;
    color: #000;
    font-style: normal;
  }
  .router-link-active {
    text-decoration: none;
  }
  // div:nth-child(2){

  // }
}
</style>
