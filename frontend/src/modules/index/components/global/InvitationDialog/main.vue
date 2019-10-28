<template>
  <el-dialog
    :visible.sync="dialogInvitationVisible"
    :before-close="handleClose"
    :modal-append-to-body="false"
    width="536"
    top="25vh"
  >
  </el-dialog>
</template>
<script>
export default {
  name: 'InvitationDialog',
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
    dialogInvitationVisible: Boolean
  }
}
</script>
<style lang="scss" scoped>
.InvitationDialog {
}
</style>
