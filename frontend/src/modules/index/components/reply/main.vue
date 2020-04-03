
<template>
  <div class="reply">
    <el-row class="bg-purple-dark">
      <el-col :span="6">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
      <el-col :span="12">
        <div class="grid-content bg-purple-light">
          <el-form :model="ruleForm" :rules="rules">
            <el-form-item prop="title">
              <el-input
                placeholder="写回答..."
                type="textarea"
                v-model="ruleForm.content"
                show-word-limit="ture"
                :rows="5"
                :autosize="sizes"
                maxlength="10000"
              ></el-input>
            </el-form-item>
            <el-button icon="el-icon-s-tools">设置</el-button>
            <el-button type="primary" @click="submit">提交回答</el-button>
          </el-form>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
    </el-row>
  </div>
</template>
<script>
export default {
  name: "reply",
  data() {
    return {
      qid: "",
      sizes: {
        minRows: 4,
        maxRows: 100
      },
      ruleForm: {
        content: ""
      },
      ruleFormBackup: {
        content: ""
      },
      rules: {
        title: [
          {
            validator: this.validateAnswer,
            trigger: "blur"
          }
        ]
      }
    };
  },
  methods: {
    getCookie(name) {
      var value = "; " + document.cookie;
      var parts = value.split("; " + name + "=");
      if (parts.length === 2) {
        return parts
          .pop()
          .split(";")
          .shift();
      }
    },
    submit: function() {
      var uid = localStorage.getItem("user_id");
      var url = "http://localhost:8000/api/answer/a/";
      // http://localhost:8000/api/answer/aid/10000000/count/
      var aid = Math.floor(Math.random() * 10000000).toString(10);
      var url1 = "http://localhost:8000/api/answer/aid/" + aid + "/count";
      this.$axios
        .get(url1)
        .then(result => {
          if (result.data.count > 0) {
            aid = Math.floor(Math.random() * 10000000).toString(10);
          }
        })
        .catch(err => {
          console.log(err);
        });
      this.$axios
        .post(
          url,
          {
            qid: this.qid,
            aid: aid,
            uid: uid,
            answer_content: this.ruleForm["content"]
          },
          {
            headers: {
              "X-CSRFToken": this.getCookie("csrftoken")
            }
          }
        )
        .then(result => {
          this.$message({ message: "成功发布回答!!" });
          this.$router.go(0);
        })
        .catch(err => {
          this.$message({ message: "很遗憾，发布答案失败!!" });
        });
    },
    validateAnswer: function(rule, value, callback) {
      callback();
    }
  },
  props: ["qids"],
  mounted() {
    this.qid = this.qids;
  },
  components: {}
};
</script>
<style lang="scss" scoped>
$minHeight: 60px;
$bg-purple-dark: #fff;
$bg-purple-light: #fff;
.reply {
  .grid-content {
    // border-radius: 4px;
    min-height: $minHeight + 10;
    .el-button {
      position: relative;
      left: 370px;
      margin-bottom: 10px;
    }
  }
  .bg-purple-light {
    background: $bg-purple-light;
  }
  .bg-purple-dark {
    background: $bg-purple-dark;
  }
}
</style>
