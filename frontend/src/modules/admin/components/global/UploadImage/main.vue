<template>
  <el-dialog title="上传图片" :visible.sync="dialog" width="400px">
    <el-upload
      class="upload-demo"
      drag
      action="https://jsonplaceholder.typicode.com/posts/"
      list-type="picture"
    >
      <i class="el-icon-upload"></i>
      <div class="el-upload__text">
        将文件拖到此处，或
        <em>点击上传</em>
      </div>
      <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
    </el-upload>
    <span slot="footer">
      <el-button @click="cancel">取消</el-button>
      <el-button type="primary" @click="doSubmit">确定</el-button>
    </span>
  </el-dialog>
</template>
<script>
export default {
  name: "UploadImage",
  data() {
    return {
      dialog: false
    };
  },
  methods: {
    cancel(){

    },
    doSubmit(){

    },

  },
  mounted() {},
  components: {},
  props: {
    dialog: {
      type: Boolean,
      required: true
    }
  }
};
</script>
<style lang="scss" scoped>
.UploadImage {
}
</style>
