<template>
  <el-dialog
    :visible.sync="dialogVoterlistVisible"
    :before-close="handleClose"
    :modal-append-to-body="false"
    width="536"
    top="25vh"
  ></el-dialog>
</template>
<script>
export default {
  name: "VoterlistDialog",
  data() {
    return {
      dialogclose: false
    };
  },
  methods: {
    handleClose(done) {
      this.dialogclose = false;
      this.$emit("listen", this.dialogclose);
      done();
    }
  },
  mounted() {},
  components: {},
  props: {
    dialogVoterlistVisible: Boolean
  }
};
</script>
<style lang="scss" scoped>
.VoterlistDialog {
}
</style>
