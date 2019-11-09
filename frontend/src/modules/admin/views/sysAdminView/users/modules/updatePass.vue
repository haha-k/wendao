<template>
  <div style="display: inline-block">
    <el-button class="button" size="mini" :disabled="data.id === 1" type="primary" @click="dialog = true">密码</el-button>
    <el-dialog :title="title" :visible.sync="dialog" width="400px" @close="cancel">
      <el-form :model="form" ref="form" :rules="rules" size="small" label-width="88px">
      <el-form-item label="新密码" prop="new_password1">
        <el-input
          v-model="form.new_password1"
          type="password"
          auto-complete="on"
          style="width: 250px;"
        />
      </el-form-item>
      <el-form-item label="确认密码" prop="new_password2">
        <el-input
          v-model="form.new_password2"
          type="password"
          auto-complete="on"
          style="width: 250px;"
        />
      </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取消</el-button>
        <el-button loading="loading" type="primary" @click="doSubmit">确认</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
export default {
  name: "updatePass",
  data() {
    const confirmPass = (rule, value, callback) => {
      if (this.form.new_password1 !== value) {
        callback(new Error("两次输入的密码不一致"));
      } else {
        callback();
      }
    };
    return {
      loading: false,
      title: "修改密码",
      dialog:false,
      form: {
        new_password1: "",
        new_password2: ""
      },
      rules: {
        new_password1: [
          {
            required: true,
            message: "请输入密码",
            trigger: "blur"
          },
          {
            min: 6,
            max: 20,
            message: "需要6到20个字符",
            trigger: "blur"
          }
        ],
        new_password2: [
          {
            required: true,
            message: "请输入密码",
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    cancel() {
      this.resetForm();
    },
    doSubmit() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.loading = true;
          console.log("TODO--->更新密码");
          // updatePasswd(this.data.id,this.form).then(res => {
          //   this.resetForm();
          // })
        } else {
          return false;
        }
      });
    },
    resetForm() {
      this.dialog = false;
      this.$refs["form"].resetFields();
      this.form = {
        new_password1: "",
        new_password2: ""
      };
    }
  },
  mounted() {},
  components: {},
  props: {
    data: {
      type: Object,
      required: true
    }
  }
};
</script>
<style lang="scss" scoped>
.updatePass {
}
</style>
