<template>
  <el-dialog
    :visible.sync="dialogAskVisible"
    :before-close="handleClose"
    :modal-append-to-body="false"
    width="536"
    top="25vh"
  >
    <ask-form></ask-form>
  </el-dialog>
</template>
<script>
import AskForm from "./components/AskForm";
export default {
  name: "AskDialog",
  data() {
    return {
      dialogclose: false
    };
  },
  methods: {
    handleClose(done) {
      // console.log("))))");
      // this.dialogAskVisible = !this.dialogAskVisible;
      this.dialogclose = false;
      this.$emit("listen", this.dialogclose);
      // console.log(this.dialogclose);
      done();
    }
  },
  mounted() {},
  components: {},
  props: {
    dialogAskVisible: Boolean
  }
};
</script>
<style lang="scss" scoped>
.Ask {
}
</style>
<style scoped>
.Ask >>> .el-dialog__body {
  padding: 0 24px 32px !important;
  margin-top: 24px;
  line-height: 1.7;
  opacity: 1;
}
</style>
