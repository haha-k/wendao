<template>
  <div class="feedCard-container">
    <h2 class="title">
      <div>
        <!-- :to="isAns?item.target.question.url:item.target.url" -->
        <router-link :to="item.target.url">{{isAns?item.target.question.title:item.target.title}}</router-link>
      </div>
    </h2>
    <div class="Content-container" :class="isCollapsed">
      <div class="cover" v-if="isThumbnail">
        <div class="cover-inner">
          <el-image style="width: 100%; height: 100%" :src="item.target.thumbnail"></el-image>
        </div>
      </div>
      <div class="text">
        <span>{{myExcerpt}}</span>
        <el-button class="contentItem-more">
          阅读全文
          <svg-icon class-name="icon1" class="icon" icon-class="more-index" />
          <!-- <i class="el-icon-arrow-down"></i> -->
        </el-button>
      </div>
    </div>
    <feedFooter :item="item" :isAns="isAns"></feedFooter>
  </div>
</template>
<script>
// import feedFooter from "@/components/global/feedFooter";
// import feedContent from "@/components/global/feedContent";
export default {
  name: "feedCard",
  data() {
    return {
      isAns: this.item.target.type === "answer",
      isThumbnail: this.item.target.thumbnail !== "",
      isCollapsed: true,
      excerpt: this.item.target.excerpt
    };
  },
  methods: {},
  mounted() {
    console.log(this.excerpt.slice(0, 100));
    console.log();
  },
  computed: {
    myExcerpt: function() {
      let Len = this.item.target.author.name.length;
      let limit = this.isThumbnail ? 105 - (Len + 3) : 80 - (Len + 3);
      console.log(limit);
      if (this.excerpt.length > limit) {
        return (
          this.item.target.author.name +
          "：" +
          this.excerpt.slice(0, limit) +
          "…"
        );
      } else {
        this.item.target.author.name + "：" + this.excerpt + "…";
      }
    }
  },
  components: {
    // feedContent: feedContent,
    // feedFooter: feedFooter
  },
  props: {
    item: Object
  }
};
</script>
<style lang="scss" scoped>
.feedCard-container {
  -webkit-tap-highlight-color: rgba(26, 26, 26, 0);
  font-weight: 600;
  cursor: pointer;

  .title {
    font-size: 18px;
    font-weight: 600;
    line-height: 1.6;
    color: #1a1a1a;
    text-align: left;
    // margin-top: -4px;
    // margin-bottom: -4px;

    & a:hover {
      color: #175199;
    }
  }

  .cover {
    width: 190px;
    height: 105px;
    float: left;
    overflow: hidden;
    margin: -2px 18px 4px 0;
    border-radius: 4px;
    background-position: 50%;
    background-size: cover;
    transform: translateZ(0);
    position: relative;

    .cover-inner {
      position: absolute;
      top: 50%;
      left: 0;
      height: 100%;
      width: 100%;
      transform: translateY(-50%);
      overflow: hidden;

      .el-image {
        position: absolute;
        top: 50%;
        left: 50%;
        width: 100%;
        transform: translate3d(-50%, -50%, 0);
      }
    }

    & + .text {
      margin-top: 16px;
    }
  }

  .is-collapsed {
    .text {
      max-height: 100px;
      cursor: pointer;
    }
  }

  .text {
    margin-top: 9px;
    margin-bottom: -4px;
    overflow: hidden;
    white-space: normal;
    word-break: break-all;
    line-height: 1.6;
    text-align: left;
    font-weight: 600;

    &:hover {
      color: rgb(100, 100, 100);
    }
  }
  .contentItem-more {
    padding: 0;
    margin-left: 4px;
    color: #175199;
    border: none;
    background-color: transparent;
    font-size: 14px;
    font-weight: 600;

    &:hover {
      color: rgb(100, 100, 100);
      // color:#fff;
    }
  }
}
</style>
