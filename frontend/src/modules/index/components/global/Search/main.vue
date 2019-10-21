
<template>
  <div class="Search-container">
    <transition>
      <el-autocomplete
        v-model="data"
        :fetch-suggestions="querySearchAsync"
        placeholder="我想知道"
        @select="handleSelect"
        popper-class="my-autocomplete"
        highlight-first-item="true"
      >
        <!-- @focus="show=false;isFocus=true"
        @blur="show=true;isFocus=false"
        :class="{focus:isFocus}" -->
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
  </div>
</template>
<script>
export default {
  name: "Search",
  data() {
    return {
      data: "",
      show: true,
      isFocus: false,
      item: {
        question_content: "x",
        question_describe: "x"
      }
    };
  },
  methods: {
    handleSearch: function() {
      // this.show=!show;
    }
  },
  mounted() {},
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
