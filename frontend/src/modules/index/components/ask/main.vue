<template>
  <el-dialog
    title="提问"
    :visible.sync="dialogAskVisible"
    :before-close="handleClose"
    :close-on-click-modal="false"
  >
    <el-form :model="ruleForm" :rules="rules">
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
      <el-form-item>
        <!-- <el-radio v-model="ruleForm.is_anonymous" label="1">匿名提问</el-radio> -->
        <el-switch
          v-model="ruleForm.is_anonymous"
          active-color="#63a"
          active-text="匿名提问"
          inactive-color="rgb(220, 223, 227)"
        ></el-switch>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="handleClose">取 消</el-button>
      <el-button type="primary" @click="postQuestion" :disabled="successContent">发布问题</el-button>
    </div>
  </el-dialog>
</template>
<script>
export default {
  name: "ask",
  data() {
    return {
      dialogclose: false,
      sizes: {
        minRows: 4,
        maxRows: 6
      },
      ruleForm: {
        title: "?",
        content: "",
        is_anonymous: false,
        uid: "",
        cid: "13"
      },
      ruleFormBackup: {
        title: "",
        content: "",
        is_anonymous: false,
        uid: "",
        cid: "13"
      },
      rules: {
        title: [
          {
            validator: this.validateQuestion,
            trigger: "blur"
          }
        ]
      },
      successContent: true
    };
  },
  methods: {
    handleClose(done) {
      // this.dialogAskVisible = !this.dialogAskVisible;
      this.dialogclose = false;
      this.$emit("listen", this.dialogclose);
      console.log(this.dialogclose);
      done();
    },
    validateQuestion: function(rule, value, callback) {
      var last = value.slice(-1, value.length);
      if (last != "？" && last != "?") {
        callback(new Error("你的问题还没有加问号呢"));
      } else {
        this.successContent = false;
        callback();
      }
    },
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
    postQuestion: function() {
      console.log(localStorage.getItem("username"));
      console.log(localStorage.getItem("user_id"));
      this.ruleForm["uid"] = localStorage.getItem("user_id");
      var url1 = "/api/question";
      var url2 = "http://localhost:8000/api/question/q/";
      var los = true;
      var count = 0;
      var qid = "";
      // while (los) {
      var qid = Math.floor(Math.random() * 100000000).toString(10);
      count++;
      // qid = "10000001";
      // if (count == 2) {
      //   qid = "10000777";
      // }
      var url3 = "http://localhost:8000/api/question/qid/" + qid + "/count/";
      this.$axios
        .get(url3)
        .then(result => {
          if (result.data.count > 0) {
            // los = false;
            qid = Math.floor(Math.random() * 10000000).toString(10);
          }
          // console.log(result);
          console.log(result.data.count);
        })
        .catch(err => {
          console.log(err);
        });
      // }
      console.log("------+++++");
      console.log(qid);
      this.ruleForm["qid"] = qid;
      this.$axios
        .post(
          url2,
          {
            // token: localStorage.getItem("token"),
            qid: this.ruleForm["qid"],
            question_content: this.ruleForm["title"],
            question_describe: this.ruleForm["content"],
            // is_anonymous:this.ruleForm["is_anonymous"],
            uid: this.ruleForm["uid"],
            cid: this.ruleForm["cid"]
          },
          {
            headers: {
              "X-CSRFToken": this.getCookie("csrftoken")
            }
          }
        )
        .then(response => {
          this.$message({ message: "成功发布问题!!" });
          this.ruleForm = this.ruleFormBackup;
          this.successContent = true;
        })
        .catch(err => {
          console.log(err);
          this.$message({ message: "很遗憾,失败了!!" });
        });
      console.log(this.ruleForm);
      this.handleClose();
    }
  },
  mounted() {},
  components: {},
  props: ["dialogAskVisible"]
};
</script>
<style lang="scss" scoped>
.el-switch {
  position: relative;
  left: -400px;
}
</style>

;:c