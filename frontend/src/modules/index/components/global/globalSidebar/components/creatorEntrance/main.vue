
<template>
<div class="creatorEntrance-container">
  <el-card>
    <a href="" class="CreatorEntrance-link">
      <div class="CreatorEntrance-hint">
        <i class="el-icon-thirdhaoyou"></i>
        <div class="creatorEntrance-text">
          <div class="Title">创作者中心
            <span>LV 1</span>
          </div>
        </div>
        <i class="el-icon-thirdxiala1"></i>
      </div>
      <div class="ProfileSideCreator-analytics">
        <div class="readCountItem">
          <div class="readCountTitle">昨日回答阅读数</div>
          <div class="readCountNumber">{{AnsReadCount}}</div>
        </div>
        <div class="readCountItem">
          <div class="readCountTitle">昨日回答赞同数</div>
          <div class="readCountNumber">{{AnsVotes}}</div>
        </div>
      </div>
    </a>
  </el-card>
</div>
</template>
<script>
export default {
  name: 'creatorEntrance',
  data(){
    return{
      AnsReadCount:1,
      AnsVotes:1,
    }
  },
  methods:{

  },
  mounted(){

  },
  components: {

  }
}
</script>
<style lang="scss" scoped>
.creatorEntrance-container {

  .el-card {
    // width: 296px;
    width: 100%;
    margin-bottom: 10px;
  }
}
</style>
