
<template>
  <div class="answerHeader">
    <el-image style="width: 10px; height: 10px" :src="url" :fit="fill"></el-image>

  </div>
</template>
<script>
export default {
  name: "answerHeader",
  data() {
    return {
      url:'https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg',
    };
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.answerHeader {
}
</style>
