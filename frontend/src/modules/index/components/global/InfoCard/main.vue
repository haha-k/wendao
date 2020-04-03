<template>
  <div class="InfoCard-container">
    <h2 class="title">
      <div>
        <!-- :to="isAns?item.question.url:item.url" -->
        <!-- <router-link :to="item.url">{{isAns?item.question.title:item.title}}</router-link> -->
        <router-link
          :to="isAns ? `/question/${item.question.id}/answer/${item.id}` :  `/article/${item.id}`"
        >{{isAns?item.question.title:item.title}}</router-link>
      </div>
    </h2>
    <div class="Content-container" :class="isCollapsed">
      <div class="cover" v-if="isThumbnail">
        <div class="cover-inner">
          <el-image style="width: 100%; height: 100%" :src="item.thumbnail"></el-image>
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
  name: "InfoCard",
  data() {
    return {
      isAns: this.item.type === "answer",
      isThumbnail: this.item.thumbnail !== "",
      isCollapsed: true,
      excerpt: this.item.excerpt
    };
  },
  methods: {},
  mounted() {},
  computed: {
    myExcerpt: function() {
      let Len = this.item.author.name.length;
      let limit = this.isThumbnail ? 105 - (Len + 3) : 80 - (Len + 3);
      if (this.excerpt.length > limit) {
        return (
          this.item.author.name + "：" + this.excerpt.slice(0, limit) + "…"
        );
      } else {
        this.item.author.name + "：" + this.excerpt + "…";
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
.InfoCard-container {
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
