<template>
  <el-card class="AuthorCard">
    <div slot="header" class="card-header">
      <div class="text">关于作者</div>
    </div>
    <div class="Card-section">
      <div class="AnswerAuthor-user">
        <div class="avatar">
          <router-link :to="authorUrl">
            <el-avatar v-if="avatarUrl" shape="square" :size="60" :src="avatarUrl"></el-avatar>
            <el-avatar v-else shape="square" :size="60" :src="squareUrl"></el-avatar>
          </router-link>
        </div>
        <div class="content">
          <div class="name">{{author.name}}</div>
          <div class="headline">
            <div class="text">{{author.headline}}</div>
          </div>
        </div>
      </div>
    </div>
    <div class="Card-section">
      <div class="counts">
        <div class="NumberBoard">
          <router-link :to="authorUrl" class="item">
            <div class="itemInner">
              <div class="itemName">回答</div>
              <strong class="itemValue">{{author.answer_count}}</strong>
            </div>
          </router-link>
          <router-link :to="authorUrl" class="item">
            <div class="itemInner">
              <div class="itemName">文章</div>
              <strong class="itemValue">{{author.articles_count}}</strong>
            </div>
          </router-link>
          <router-link :to="authorUrl" class="item">
            <div class="itemInner">
              <div class="itemName">关注者</div>
              <strong class="itemValue">{{author.follower_count}}</strong>
            </div>
          </router-link>
        </div>
      </div>
      <div class="button-group">
        <!-- <el-button></el-button> -->
        <el-button class="first" icon="el-icon-thirdjia">关注他</el-button>
        <el-button class="second" icon="el-icon-thirdcomment">发私信</el-button>
      </div>
    </div>
  </el-card>
</template>
<script>
import { getMember } from "#/api/member";
export default {
  name: "AuthorCard",
  data() {
    return {
      author: {},
      authorUrl: "/",
      avatarUrl:
        "https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png",
      squareUrl:
        "https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png"
    };
  },
  methods: {
    getMembers(uid) {
      getMember(uid)
        .then(result => {
          let { data } = result;
          this.author = data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mounted() {
    this.getMembers(this.uid);
  },
  components: {},
  props: {
    uid: String,
    name: String
  }
};
</script>
<style lang="scss" scoped>
.AuthorCard {
  margin-bottom: 10px;
  background: #fff;
  overflow: hidden;
  border-radius: 2px;
  box-shadow: 0 1px 3px rgba(26, 26, 26, 0.1);
  box-sizing: border-box;

  .card-header {
    height: 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 1px solid #f6f6f6;
    box-sizing: border-box;
    .text {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      font-weight: 600;
    }
  }

  .Card-section {
    padding: 16px 20px;
    position: relative;

    .AnswerAuthor-user {
      display: flex;
      align-items: center;
      .avatar {
        margin-right: 12px;
      }
      .content {
        flex: 1 1;
        overflow: hidden;
        .name,
        .headline {
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
          font-weight: 600;
        }
        .name {
          font-size: 20px;
          line-height: 30px;
          color: #1a1a1a;
          text-align: left;
        }
        .headline {
          font-size: 14px;
          line-height: 20px;

          .text {
            overflow: hidden;
            text-overflow: ellipsis;
            word-break: break-word;
            line-height: 1.6;
          }
        }
      }
    }

    .counts {
      font-size: 14px;
      text-align: center;
      .NumberBoard {
        display: flex;
        .item {
          flex: 1 1;
          border: 0;
          line-height: unset;
          font-size: unset;
          .itemInner {
            text-align: center;
            line-height: 1.6;
            .itemName {
              font-style: 14px;
              color: #8590a6;
            }
            .itemValue {
              display: inline-block;
              font-size: 18px;
              color: #1a1a1a;
              font-weight: 600;
            }
          }
        }
      }
    }

    .button-group {
      display: flex;
      margin-top: 16px;

      .el-button {
        flex: 1 1;

        &.first {
        }
        &.second {
        }
      }
    }
  }
}
</style>
<style scoped>
.AuthorCard >>> .el-card__body {
  padding: 0 !important;
}
.AuthorCard >>> .el-card__header {
  padding: 0 20px !important;
}
</style>