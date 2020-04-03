<template>
  <div class="collectionCard">
    <div class="header">
      <div class="info">
        <router-link :to="`/collection/${favItem.id}`" class="title">{{favItem.title}}</router-link>
        <div class="relateMembers">
          <div class="creator">
            <span class="creator-avatar">
              <el-avatar shape="square" :size="28" :src="favItem.creator.avatar_url"></el-avatar>
            </span>
            <router-link to="/" class="Name">{{favItem.creator.name}}</router-link>
            <span class="creator-suffix">创建</span>
          </div>
          <div class="followers">{{favItem.follower_count}}人关注</div>
        </div>
      </div>
      <div class="followButton">
        <el-button
          @click="handlerFollow"
          :class="{ 'is-active': followStatus }"
        >{{ followStatus == true ? "已关注" : "关注收藏夹" }}</el-button>
      </div>
    </div>
    <div class="contentList">
      <div class="contentItem" v-for="(item,index) in favItem.favitems" :key="index">
        <router-link
          v-if="item.content.question"
          :to="`/question/${item.content.question.id}/answer/${item.content.id}`"
          class="title"
        >{{item.content.question.title}}</router-link>
        <router-link v-else :to="`/article/${item.content.id}`" class="title">{{item.content.title}}</router-link>

        <div class="Excerpt" v-html="item.content.excerpt"></div>
        <div class="Tags">
          <span class="TypeTag">{{item.content.type==="answer"?"回答":"文章"}}</span>
          <span class="CountTag">{{item.content.voteup_count}} 赞同</span>
          <span class="CountTag">{{item.content.comment_count}} 评论</span>
        </div>
      </div>
    </div>
    <router-link :to="`/collection/${favItem.id}`" class="Count">
      已收藏{{favItem.total_count}}条内容
      <i class="el-icon-thirdxiangshangjiantouarrowup1"></i>
    </router-link>
  </div>
</template>
<script>
export default {
  name: "collectionCard",
  data() {
    return {
      followStatus: false
    };
  },
  computed: {
    getImg(imgSrc) {
      return require(imgSrc);
    }
  },
  methods: {
    handlerFollow() {
      this.followStatus = !this.followStatus;
    }
  },
  mounted() {},
  components: {},
  props: {
    favItem: Object
  },
  watch: {
    favItem: {
      handler: (newVal, oldVal) => {
        this.favItem = newVal;
      },
      deep: true
    }
  }
};
</script>
<style lang="scss" scoped>
.collectionCard {
  flex-shrink: 0;
  width: 482px;
  height: 364px;
  border-radius: 4px;
  box-shadow: 0 1px 3px 0 rgba(26, 26, 26, 0.1);
  background-color: #fff;
  .header {
    display: flex;
    margin: 0 24px;
    padding: 24px 0 20px;
    box-sizing: border-box;
    height: 112px;
    border-bottom: 1px solid #ebebeb;
    overflow: hidden;
    .info {
      flex: 1 1;
      overflow: hidden;
      text-align: left;
      .title {
        display: block;
        height: 28px;
        line-height: 28px;
        font-size: 20px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: normal;
        font-weight: 600;
      }
      .relateMembers {
        display: flex;
        align-items: center;
        margin-top: 12px;
        .creator {
          height: 28px;
          line-height: 27px;
          display: flex;
          align-items: center;
          .creator-avatar {
          }
          .Name {
            margin-left: 8px;
            color: #444;
            font-weight: 500;
            .creator-suffix {
              margin-left: 4px;
              color: #999;
              font-size: 14px;
              font-weight: 400;
            }
          }
        }

        .followers {
          margin-left: 12px;
          padding-left: 12px;
          height: 19px;
          line-height: 19px;
          font-size: 14px;
          color: #999;
          border-left: 2px solid #ebebeb;
        }
      }
      .followButton {
        margin-left: 20px;

        .el-button {
          &.is-active {
            color: #fff;
            background-color: #8590a6;
          }
        }
      }
    }
  }
  .contentList {
    margin: 20px 24px;
    height: 164px;
    text-align: left;

    .contentItem:nth-child(2) {
      margin-top: 20px;
    }

    .title {
      display: block;
      height: 21px;
      line-height: 21px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      font-weight: 600;
    }

    .Excerpt {
      margin-top: 4px;
      height: 21px;
      line-height: 21px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      font-weight: 600;
    }
    .Tags {
      display: flex;
      align-items: center;
      margin-top: 6px;
      span {
        flex-shrink: 0;
      }
      .TypeTag {
        height: 20px;
        line-height: 20px;
        padding: 0 4px;
        background-color: #f6f6f6;
        color: #999;
        font-size: 12px;
        margin-right: 8px;
      }
      .CountTag + .CountTag::before {
        content: "\B7";
        margin: 0 3px;
      }
      .CountTag {
        height: 17px;
        line-height: 17px;
        font-size: 12px;
        color: #999;

        & + &::before {
          content: "\B7";
          margin: 0 3px;
        }
      }
    }
  }
  .Count {
    display: flex;
    align-items: center;
    margin: 20px 24px 0;
    height: 24px;
    font-weight: 600;
    color: #8590a6;
    font-size: 14px;
  }
}
</style>
<style scoped>
.followButton >>> .el-button {
  color: #0084ff;
  background-color: rgba(0, 132, 255, 0.08);
  width: 102px;
  height: 32px;
  border-radius: 3px;
  font-weight: 600;
  padding: 0 !important;
}
</style>
