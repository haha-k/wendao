<template>
<div class="upload">
<el-upload
  class="upload-demo"
  drag
  list-type="picture"
  action="https://127.0.0.1:8000/"
  multiple>
  <i class="el-icon-upload"></i>
  <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
  <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
</el-upload>
</div>
</template>
<script>
import { addPic } from "@/api/picture";
export default {
  name: 'upload',
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
.pictures {
}
</style>
