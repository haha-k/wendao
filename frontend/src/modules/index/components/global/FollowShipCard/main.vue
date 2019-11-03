<template>
  <div class="FollowShipCard">
    <el-card :body-style="{ padding: '0px' }">
      <div class="NumberBoard">
        <router-link to="/people/xxx">
          <div class="iteminner">
            <div class="name">关注了</div>
            <strong class="value">{{"49"}}</strong>
          </div>
        </router-link>
        <router-link to="/people/xxx">
          <div class="iteminner">
            <div class="name">关注者</div>
            <strong class="value">{{"1,234"}}</strong>
          </div>
        </router-link>
      </div>
    </el-card>
  </div>
</template>
<script>
export default {
  name: "FollowShipCard",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.FollowShipCard {
  .NumberBoard{
    display: flex;
    a {
      border: 0;
      flex:1 1;
      .iteminner{
        padding: 12px 0;
        text-align: center;
        line-height: 1.6;
        .name {
          font-size: 14px;
          color: #8590a6;
        }
        .value{
          display: inline-block;
          font-size: 18px;
          font-weight: 600;
          color: #1a1a1a;
        }
      }
    }
  }

}
</style>
