<template>
<div class="edit">
  <el-button type="success" size="mini" :disabled="data.id===1" @click="to">编辑</el-button>
  <eForm ref="form" :isAdd="false"></eForm>


</div>
</template>
<script>
import eForm from './form'
export default {
  name: 'edit',
  data(){
    return{

    }
  },
  methods:{
    to(){
      const _this = this.$refs.form;
      _this.roleIds = [];
      _this.form = {
        id: this.data.id,
        username: this.data.username,
        nickname: this.data.nickname,
        email: this.data.email,
        telephone: this.data.telephone,
        is_active: this.data.is_active.toString(),
        birthdate:this.data.birthdate,
        gender: this.data.gender===null?null:this.data.gender.toString(),
      };
      _this.dialog = true;
    },
  },
  mounted(){

  },
  props:{
    data: {
      type: Object,
      required:true
    }
  },
  components: {
    eForm:eForm
  }
}
</script>
<style lang="scss" scoped>
.edit {
    display: inline-block;
    margin-right: 3px;
}
</style>
