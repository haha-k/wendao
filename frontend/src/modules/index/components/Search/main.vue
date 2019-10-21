<template>
  <div>
    <!-- <el-row gutter="20">
      <el-col :span="12"></el-col>
    </el-row>-->
    <el-row class="bg-purple-dark">
      <el-col :span="6">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
      <el-col :span="12">
        <div class="grid-content bg-purple-light">
          <el-autocomplete
            v-model="data"
            :fetch-suggestions="querySearchAsync"
            placeholder="我想知道"
            @select="handleSelect"
            class="input myauto"
            popper-class="my-autocomplete"
            suffix-icon
            highlight-first-item="true"

          >
            <!-- <el-select v-model="value" slot="prepend" placeholder="搜索类型">
              <el-option label="搜索" :value="val"></el-option>
              <el-option label="提问" :value="val"></el-option>
            </el-select>-->
            <template #default="{ item }">
              <!-- <div class="addr">{{item.title}}</div>
        <div class="name">{{item.link}}</div>
              <div class="name">{{item.copyright}}</div>-->
              <div class="name">{{item.question_content}}</div>
              <div class="addr">{{item.question_describe}}</div>
            </template>
          </el-autocomplete>
          <el-button slot="append">
            <i class="el-icon-search"></i>
          </el-button>
          <el-button slot="append" @click="ask">提问</el-button>
          <ask :dialogAskVisible="dialogAskVisible" @listen="lis"></ask>
        </div>
      </el-col>
      <el-col :span="6">
        <div class="grid-content bg-purple-light"></div>
      </el-col>
    </el-row>
  </div>
  <!-- <el-input v-model="input" placeholder="请输入内容"></el-input> -->
</template>
<script>
// import service from "../../api";
import ask from "@/components/ask";
export default {
  name: "Search",
  data() {
    return {
      datas: [],
      data: "",
      res: null,
      timeout: null,
      val: "搜索",
      dialogAskVisible: false,
    };
  },
  methods: {
    lis:function(data){
        console.log("-------");
        console.log(data);
        this.dialogAskVisible = false;
    },
    ask(){
      this.dialogAskVisible = true;
      console.log(this.dialogAskVisible)

    },
    loadAll() {
      // var res;
      // var url = "http://localhost:8000/api/book/?format=json";
      var url = "http://localhost:8000/api/question/all/";
      this.$axios.get(url).then(response => {
        this.res = response.data;
        // console.log(typeof this.datas);
        // this.res = JSON.stringify(response.data);
        // console.log(this.res);
        // this.datas = JSON.parse(this.res);
        // console.log(this.res[0]['content'])
        // this.res.forEach(element => {
        //   console.log(element);
        //   console.log(JSON.stringify(element).toString());
        // });
        // Object.keys(this.res).map((item, index) => ({key: item, value:this.res[item]}));
        // console.log(this.res);
        // console.log(Object.keys(this.res[0]));
        // console.log(this.res.filter(this.createFilter("haha")));
      });
      // return res;
    },
    querySearchAsync(queryString, cb) {
      var res = this.res;
      var results;
      console.log(res);
      if (typeof res !== "undefined") {
        var results = queryString
          ? res.filter(this.createFilter(queryString))
          : res;
      }
      // console.log(res.filter(this.createFilter(queryString)));
      cb(results);
    },
    createFilter(queryString) {
      return data => {
        return (
          data.question_content.toLowerCase().indexOf(queryString.toLowerCase()) === 0
        );
      };
    },
    handleSelect(item) {
      console.log(item);
      this.data = item.question_content;
    }
  },
  mounted() {
    this.loadAll();
  },
  components: {
    "ask": ask
  }
};
</script>
<style>
.el-input__inner {
  height: 60px !important;
  line-height: 60px !important;
  font-size: 18px !important;
}
.el-button__inner {
}
</style>

<style lang="scss" scoped>
$testpx: 200px;
$minHeight: 60px;
$bg-purple-dark: #fff;
$bg-purple-light: #fff;
.el-row {
  margin: 0;
  padding: 0;
}
.el-autocomplete {
  // height: $minHeight+30px;
  // line-height: $minHeight;
}

.input {
  // line-height: $minHeight;
  // height: $testpx - 100px;
  width: $testpx + 300px;
  // height: $minHeight;
}
.grid-content {
  // border-radius: 4px;
  min-height: $minHeight + 10;
}
.bg-purple-light {
  background: $bg-purple-light;
}
.bg-purple-dark {
  background: $bg-purple-dark;
}
.my-autocomplete {
  // height: 45px;
  li {
    line-height: 200px;
    padding: 2px;

    .name {
      text-overflow: ellipsis;
      overflow: hidden;
    }
    .addr {
      font-size: 12px;
      color: #b4b4b4;
    }

    .highlighted .addr {
      color: #ddd;
    }
  }
}
.el-button {
  margin-left: 40px;
  background-color: rgb(236, 245, 255);
  height: $minHeight - 10;
  width: $minHeight + 20;
  color: rgb(64, 158, 255);
  border-radius: 5px;
  margin-top: 5px;
  margin-bottom: 5px;
}
</style>