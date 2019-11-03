<template>
<div class="achievementCard">
  <el-card :body-style="{ padding: '0px' }">
    <div slot="header" class="Card-header">
      <span>个人成就</span>
    </div>
    <div class="Items">
      <div class="Item">
        <div class="IconGraf">
          
        </div>
      </div>
    </div>
  </el-card>
</div>
</template>
<script>
export default {
  name: 'AchievementCard',
  data(){
    return{

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
.achievementCard {
  .Card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 50px;
    border-bottom: 1px solid #f6f6f6;
    box-sizing: border-box;
  }
}
</style>
<style scoped>
  .achievementCard >>> .el-card__header{
    padding: 0 20px !important;
  }

</style>
