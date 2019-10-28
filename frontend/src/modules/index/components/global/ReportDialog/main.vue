<template>
  <el-dialog
    :visible.sync="dialogReportVisible"
    :before-close="handleClose"
    :modal-append-to-body="false"
    width="536"
    top="25vh"
  >
  </el-dialog>
</template>
<script>
export default {
  name: 'ReportDialog',
  data(){
    return{
      dialogclose: false

    }
  },
  methods:{
    handleClose(done) {
      this.dialogclose = false;
      this.$emit("listen", this.dialogclose);
      done();
    }

  },
  mounted(){

  },
  components: {

  },

  props: {
    dialogReportVisible: Boolean
  }
}
</script>
<style lang="scss" scoped>
.ReportDialog {
}
</style>
