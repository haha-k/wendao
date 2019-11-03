<template>
  <div class="appMain-container">
    <div class="ListShortcut">
      <div class="List-header">
        <h4 class="headerText">
          <span>{{"我的"+tab}}</span>
        </h4>
        <div class="headerOptions"></div>
      </div>

    </div>
  </div>
</template>
<script>
export default {
  name: "AppMain",
  data() {
    return {};
  },
  methods: {},
  created() {},
  watch: {},
  mounted() {},
  components: {},
  props: {
    tab:String,
  }
};
</script>
<style lang="scss" scoped>
.appMain-container {
    .List-header{
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 50px;
        margin: 0 20px;
        border-bottom: 1px solid #f6f6f6;
        box-sizing: border-box;

        .headerText {
            font-weight: 600;
            margin: 0;


        }
        .headerOptions{

        }
    }
}
</style>