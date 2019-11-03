<template>
  <div class="collectionCard">
    <div class="header">
      <div class="info">
        <router-link to="/" class="title">{{"游戏设计"}}</router-link>
        <div class="relateMembers">
          <div class="creator">
            <span class="creator-avatar">
              <el-avatar shape="square" :size="28"></el-avatar>
            </span>
            <router-link to="/" class="Name">{{"唐大行"}}</router-link>
            <span class="creator-suffix">创建</span>
          </div>
          <div class="followers">{{311}}人关注</div>
        </div>
      </div>
      <div class="followButton">
        <el-button>关注收藏夹</el-button>
      </div>
    </div>
    <div class="contentList">
      <div class="contentItem" v-for="i in 2" :key="i">
        <router-link to="/" class="title">"但美国回家的路上空间和老师的江户时代可能就会"</router-link>
        <div class="Excerpt">
          {{"附件是"}}
          :
          {{"房价多少人口和军事打击人家"}}
        </div>
        <div class="Tags">
          <span class="TypeTag">文章</span>
          <span class="CountTag">{{"123"}} 赞同</span>
          <span class="CountTag">{{"12"}} 评论</span>
        </div>
      </div>
    </div>
    <router-link to="/" class="Count">
      已收藏{{"1345"}}条内容
      <i class="el-icon-thirdxiangshangjiantouarrowup1"></i>
    </router-link>
  </div>
</template>
<script>
export default {
  name: "collectionCard",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.collectionCard {
  flex-shrink: 0;
  width: 490px;
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
      .CountTag+.CountTag::before {
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
