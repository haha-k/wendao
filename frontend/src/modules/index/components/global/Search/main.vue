<template>
  <div class="Search-container">
    <transition>
      <el-autocomplete
        v-model="data"
        :fetch-suggestions="querySearchAsync"
        placeholder="我想知道"
        @select="handleSelect"
        popper-class="my-autocomplete"
        :highlight-first-item="true"
      >
        <!-- @focus="show=false;isFocus=true"
        @blur="show=true;isFocus=false"
        :class="{focus:isFocus}"-->
        <!-- <template #default="{ item }">
        <div class="name">{{item.question_content}}</div>
        <div class="addr">{{item.question_describe}}</div>
        </template>-->
        <i slot="suffix" class="el-input__icon el-icon-search search-icon" @click="handleSearch"></i>
      </el-autocomplete>
    </transition>
    <transition name="fade">
      <el-button v-if="show" type="primary" class="ask-button" @click="ask">提问</el-button>
    </transition>
    <ask-dialog :dialogAskVisible="visible" @listen="getStatus"></ask-dialog>

    <!-- <comment-dialog :dialogCommentVisible="true" :aid="111" @listen="getStatus"></comment-dialog> -->
    <!-- <favlists-dialog :dialogFavlistsVisible="true" @listen="getStatus"></favlists-dialog> -->
    <a href></a>
  </div>
</template>
<script>
export default {
  name: "Search",
  data() {
    return {
      data: "",
      show: true,
      visible: false,
      isFocus: false,
      item: {
        question_content: "x",
        question_describe: "x"
      },
      restaurants: []
    };
  },
  methods: {
    getStatus(status) {
      this.visible = status;
    },
    handleSearch: function() {
      // this.show=!show;
    },
    ask() {
      this.visible = true;
    },
    loadAll() {
      return [
        {
          value: "(小杨生煎)西郊百联餐厅",
          address: "长宁区仙霞西路88号百联2楼"
        },
        { value: "阳阳麻辣烫", address: "天山西路389号" },
        {
          value: "南拳妈妈龙虾盖浇饭",
          address: "普陀区金沙江路1699号鑫乐惠美食广场A13"
        }
      ];
    },
    querySearchAsync(queryString, cb) {
      var restaurants = this.restaurants;
      var results = queryString
        ? restaurants.filter(this.createStateFilter(queryString))
        : restaurants;

      clearTimeout(this.timeout);
      this.timeout = setTimeout(() => {
        cb(results);
      }, 3000 * Math.random());
    },
    createStateFilter(queryString) {
      return state => {
        return (
          state.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0
        );
      };
    },
    handleSelect(item) {}
  },
  mounted() {
    this.restaurants = this.loadAll();
  },
  components: {}
};
</script>


<style lang="scss" scoped>
@import "@/styles/variables.scss";
.Search-container {
  height: 34px;
  // height: $navbarHeight;
  // line-height: 34px;
  width: $SearchWidth;
  display: flex;
  // justify-content: space-between;
  align-items: center;

  .fade-enter-active,
  .fade-leave-active {
    transition: opacity 0.3s;
  }
  .fade-enter,
  .fade-leave-to {
    opacity: 0;
  }
  .el-autocomplete {
    height: 100%;
    border-right: none;
    width: 250px;
    color: #8590a6;

    .search-icon {
      cursor: pointer;
    }

    // .el-input {
    //   width: 326px;
    // }

    &.focus {
      width: 100%;
      background-color: rgb(133, 25, 25);
      transition: width 1s ease-in-out;
    }
  }

  .ask-button {
    height: 100%;
    margin-left: 20px;
  }
}

.my-autocomplete {
  div {
    width: 400px;
    transition: width 1s ease-in-out;
  }
}
</style>
<style scoped>
.Search-container >>> .el-input .el-input__inner {
  height: 34px !important;
  line-height: 34px !important;
  font-size: 14px !important;
  font-weight: 600;
}
</style>
