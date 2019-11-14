<template>
  <div class="header-container">
    <el-card>
      <div class="userCover">
        <div class="CoverEditor"></div>
      </div>
      <div class="wrapper">
        <div class="main">
          <div class="avatar">
            <el-image :src="avatar" :fit="contain">
              <div slot="error">
                <i class="el-icon-picture-outline"></i>
              </div>
            </el-image>
          </div>
          <div class="content">
            <div class="content-head">
              <h1 class="title">
                <span class="name">{{me.name}}</span>
                <span class="headline" v-if="me.headline">{{me.headline}}</span>
              </h1>
            </div>
            <div class="content-body"></div>
            <div class="content-footer">
              <el-button icon="el-icon-arrow-down" class="expand-button">查看详细资料</el-button>
              <el-button class="edit-button" @click="handlerEdit">编辑个人资料</el-button>
            </div>
          </div>
        </div>
      </div>
    </el-card>
  </div>
</template>
<script>
export default {
  name: "ProfileHeader",
  data() {
    return {
      profile: this.me,
      avatar: ""
    };
  },
  methods: {
    handlerEdit(){
      this.$router.push('/profile/edit');
    }
  },
  created() {},
  watch: {
    me: {
      handler: function(newVal, oldVale) {
        this.profile = newVal;
        this.avatar = newVal.avatar_url;
        console.log(this.avatar);
      },
      deep: true
    }
  },
  mounted() {},
  components: {},
  props: {
    me: Object
  }
};
</script>
<style lang="scss" scoped>
.header-container {
  position: relative;
  width: 1000px;
  padding: 0 16px;
  margin: 10px auto;
  .el-card {
    .userCover {
      height: 132px;
      background: #999;
    }

    .wrapper {
      position: relative;
      width: 100%;
      background: #fff;
      box-sizing: border-box;

      .main {
        position: relative;
        margin: 0 20px 24px;
        .avatar {
          position: absolute;
          left: 0;
          z-index: 1;
          border: 4px solid #fff;
          top: -74px;
          width: 160px;
          height: 160px;
          border-radius: 2px;
          .el-image {
          }
        }
        .content {
          padding-top: 16px;
          padding-left: 32px;
          border-left: 164px solid transparent;
          .content-head {
            position: relative;
            padding-right: 106px;
            margin-bottom: 16px;
            h1 {
              margin: 0 !important;
              text-align: left;
            }
            .title {
              flex: 1 1;
              overflow: hidden;
              text-overflow: ellipsis;
              white-space: nowrap;
              text-align: left;
              .name {
                font-size: 26px;
                font-weight: 600;
                line-height: 30px;
              }
              .headline {
                margin-left: 12px;
                font-size: 18px;
                font-weight: 500;
                white-space: nowrap;
              }
            }
          }
          .content-footer {
            position: relative;
            padding-top: 8px;
            .expand-button {
              padding: 0;
              background-color: transparent;
              border: none;
              position: absolute;
              left: 0;
              top: 0;

            }
            .edit-button {
              position: absolute;
              right: 0;
              bottom: 0;
            }
          }
        }
      }
    }
  }
}
</style>
<style scoped>
.header-container >>> .el-card__body {
  padding: 0 !important;
}
</style>