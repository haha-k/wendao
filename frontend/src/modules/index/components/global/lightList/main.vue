<template>
  <div class="lightList">
    <router-link to="/people/xxx" class="Item">
      <span class="ItemName">关注的话题</span>
      <span class="ItemValue">{{"12"}}</span>
    </router-link>
    <router-link to="/people/xxx" class="Item">
      <span class="ItemName">关注的专栏</span>
      <span class="ItemValue">{{"24"}}</span>
    </router-link>
    <router-link to="/people/xxx" class="Item">
      <span class="ItemName">关注的问题</span>
      <span class="ItemValue">{{"124"}}</span>
    </router-link>
    <router-link to="/people/xxx" class="Item">
      <span class="ItemName">关注的收藏夹</span>
      <span class="ItemValue">{{"12"}}</span>
    </router-link>
  </div>
</template>
<script>
export default {
  name: "lightList",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.lightList {
  .Item {
    padding-left: 5px;
    display: flex;
    align-items: center;
    font-size: 14px;
    border-top: 1px solid #ebebeb;
    height: 46px;
    text-align: left;
    .ItemName {
      flex-grow: 1;
    }
    .ItemValue {
      font-size: 14px;
      color:#8590a6;
    }
  }
}
</style>
