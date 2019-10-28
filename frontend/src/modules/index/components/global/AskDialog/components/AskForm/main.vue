<template>
  <div class="AskForm-content">
    <el-form :model="AskForm" :rules="rules">
      <div>
        <div class="Ask-items">
          <div class="item">
            <el-avatar></el-avatar>
            <div class="title">
              <el-form-item prop="title">
                <el-input
                  type="text"
                  v-model="ruleForm.title"
                  autocomplete="off"
                  show-word-limit="ture"
                  maxlength="40"
                  placeholder="写下你的问题哟,准确描述更容易找到你想要的答案哦"
                ></el-input>
              </el-form-item>
            </div>
          </div>
          <div class="item">
            <div class="detail">
              <el-form-item prop="content">
                <el-input
                  type="textarea"
                  v-model="ruleForm.content"
                  show-word-limit="ture"
                  placeholder="输入问题详情描述信息(选填)"
                  :rows="5"
                  :autosize="sizes"
                  maxlength="3000"
                ></el-input>
              </el-form-item>
            </div>
          </div>
        </div>
      </div>
      <div class="Ask-footer">
        <el-form-item>
          <el-radio v-model="ruleForm.is_anonymous" label="1">匿名提问</el-radio>
        </el-form-item>
        <el-button>发布</el-button>
      </div>
    </el-form>
  </div>
</template>
<script>
export default {
  name: "AskForm",
  data() {
    return {
      ruleForm: {
        title: "?",
        content: "",
        is_anonymous: false
      },
      ruleFormBackup: {
        title: "",
        content: "",
        is_anonymous: false
      },
      rules: {
        title: [
          {
            validator: this.validateQuestion,
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.AskForm-content {
  // padding: 0 24px 32px;
  // margin-top: 24px;
  // line-height: 1.7;
  // opacity: 1;
}
</style>
