<template>
  <el-form>
    <el-form-item label="用户名">
      <el-input v-model.trim="user.name" />
    </el-form-item>
    <el-form-item label="密码">
      <el-input v-model.trim="user.password" />
    </el-form-item>
    <el-form-item label="邮箱">
      <el-input v-model.trim="user.email" />
    </el-form-item>
    <el-form-item label="手机">
      <el-input v-model.trim="user.telephone" />
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submit">更新</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
export default {
  props: {
    user: {
      type: Object,
      default: () => {
        return {
          name: '',
          email: '',
          telephone:'18752627678',
          password:'*******'
        }
      }
    }
  },
  methods: {
    submit() {
      this.$message({
        message: '用户信息成功更新',
        type: 'success',
        duration: 5 * 1000
      })
    }
  }
}
</script>
