<template>
  <div class="FavlistsDialog-container">
    <el-dialog
      :visible.sync="dialogFavlistsVisible"
      :before-close="handleClose"
      :modal-append-to-body="false"
      width="536px"
      top="10vh"
      custom-class="FavlistsDialog"
    >
      <div slot="title" v-if="step1Show">
        <h3 class="title">添加收藏</h3>
        <div class="subtitle">请选择你想添加的收藏夹</div>
      </div>
      <div slot="title" v-else>
        <h3 class="title">创建新收藏夹</h3>
      </div>
      <div class="content" v-if="step1Show" :class="{ is_step: step1Show }">
        <div class="favlists-content">
          <!-- <el-scrollbar style="height:100%"> -->
          <div class="items">
            <div class="item" v-for="(i, index) in favlists" :key="i.id">
              <div class="inner">
                <div class="item-name">
                  <span>{{ i.title }}</span>
                  <i class="el-icon-lock" v-if="!i.is_public"></i>
                </div>
                <div class="item-count">
                  <span>{{ i.answer_count }} 条内容</span>
                </div>
              </div>
              <el-button
                class="collect"
                :class="{ collected: collectStatus[index].collected }"
                @click="handlerCollect(index)"
              >{{collectStatus[index].collected ?"已收藏":"收藏"}}</el-button>
              <!-- <el-button
                v-if="!collectStatus[index].collected"
                class="collect"
                @click="handlerCollect(index)"
                :class="{ collected: is_collected }"
                >收藏</el-button
              >
              <el-button v-else class="collected" @click="handlerCancelCollect"
                >已收藏</el-button
              >-->
            </div>
          </div>
          <!-- </el-scrollbar> -->
          <div class="actions">
            <el-button @click="handleCreate">创建收藏夹</el-button>
          </div>
        </div>
      </div>
      <div class="content" v-else>
        <el-form class="Createfavlist-content" :model="form" :rules="rules">
          <div class="addItems">
            <el-form-item class="addItem">
              <el-input v-model="form.title" placeholder="收藏标题"></el-input>
            </el-form-item>
            <el-form-item class="addItem">
              <el-input type="textarea" :rows="5" v-model="form.desc" placeholder="收藏描述 (可选)"></el-input>
            </el-form-item>
            <el-form-item class="addItem">
              <el-radio-group v-model="form.is_public">
                <el-radio :label="true">
                  <span class="labelTitle">公开</span>
                  <span class="labelDesc">有其他人关注此收藏夹时不可设置为私密</span>
                </el-radio>
                <el-radio :label="false">
                  <span class="labelTitle">私密</span>
                  <span class="labelDesc">只有你自己可以查看这个收藏夹</span>
                </el-radio>
              </el-radio-group>
            </el-form-item>
          </div>
          <div class="ButtonGroup">
            <el-button @click="handleBack">返回</el-button>
            <el-button :disabled="form.title==''" @click="handlerCreate">确认创建</el-button>
          </div>
        </el-form>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { getCollected, getFavlists } from "#/api/favlists";
import { log } from "util";
export default {
  name: "FavlistsDialog",
  data() {
    return {
      dialogclose: false,
      favlists: [],
      collectStatus: [],
      step1Show: true,
      step2Show: false,
      innerVisible: false,
      dialogFavlistsVisible: false,
      collectText: "已收藏",
      form: {
        title: "",
        desc: "",
        is_public: true
      },
      rules: {},
      allow_create: true
    };
  },
  methods: {
    handlerCreate() {
      this.handleBack();
    },
    handlerCollect(index) {
      let status = this.collectStatus[index].collected;
      console.log(status);
      this.collectStatus[index].collected = !this.collectStatus[index]
        .collected;
    },
    handleCreate() {
      this.step1Show = false;
    },
    handleBack() {
      this.step1Show = true;
    },
    g() {
      this.dialogFavlistsVisible = false;
      this.setp1Show = false;
      this.innerVisible = true;
      this.setp2Show = true;
    },
    handleClose(done) {
      this.dialogclose = false;
      this.$emit("listen", this.dialogclose);
      done();
    },
    judgeStatus(fid) {
      console.log(fid);
      return true;
      // let c = this.collectStatus.find(item => {
      //   return item["favlist_id"]===fid;
      // });
      // console.log(c);
    },
    getCollection(uid, aid) {
      getCollected(aid)
        .then(result => {
          let { data } = result;
          this.collectStatus = data;
        })
        .catch(err => {
          console.log(err);
        });
      getFavlists(uid)
        .then(result => {
          let { data } = result.data;
          this.favlists = data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mounted() {
    // this.getCollection(this.uid, this.aid);
    this.getCollection(1, 1);
  },
  components: {},
  props: {
    dialogFavlistsVisible: Boolean,
    aid: String,
    uid: String
  }
};
</script>
<style lang="scss" scoped>
.el-dialog.FavlistsDialog {
  h3 {
    margin: 0;
  }
  .title {
    font-size: 24px;
    text-align: center;
    color: #1a1a1a;
    font-weight: 600;
    margin-top: 40px;
  }
  .subtitle {
    padding: 0 38px;
    margin-top: 4px;
    font-size: 14px;
    line-height: 1.5;
    color: #8590a6;
    text-align: center;
    font-weight: 600;
  }

  .content {
    flex: 1 1;
    padding: 0 24px 32px;
    margin-top: 24px;
    line-height: 1.7;
    opacity: 1;
    .items {
      max-height: 335px;
      min-height: 140px;
      margin-bottom: 40px;
      overflow-x: hidden;
      overflow-y: auto;

      .item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 8px 0;
        border-bottom: 1px solid #ebebeb;

        .inner {
          overflow: hidden;
          margin-right: 20px;
          .item-name {
            display: flex;
            overflow: hidden;
            text-overflow: ellipsis;
          }
          .item-count {
            font-size: 14px;
            color: #8590a6;
            margin-top: 4px;
          }
        }
        .el-button {
          width: 76px;
          font-weight: 600;
        }

        .collect {
          color: #0084ff;
          border-color: #0084ff;
        }
        .collected {
          color: #fff;
          background-color: #8590a6;
        }
      }
    }
    .actions {
      .el-button {
        width: 220px;
        font-weight: 600;
        color: #fff;
        background-color: #0084ff;
      }
      .el-button {
        width: 220px;
        color: #fff;
        background-color: #0084ff;

        &:hover {
          border-color: #0077e6;
          background-color: #0077e6;
        }
      }
    }

    .Createfavlist-content {
      .addItems {
        .addItem {
          margin-bottom: 8px;

          &:nth-child(2) > .el-input {
          }

          .el-radio-group {
            display: block;
            text-align: left;
            // display: flex;
            // justify-content: flex-start;
            .el-radio {
              display: block;
              margin-bottom: 6px;
              overflow: auto;
              font-size: 14px;
            }
            .labelTitle {
              font-weight: 600;
              color: #1a1a1a;
            }
            .labelDesc {
              color: #8590a6;
              margin-left: 4px;
              font-weight: 600;
            }
          }
        }
      }

      .ButtonGroup {
        margin-top: 48px;
        display: flex;
        flex-direction: row;

        .el-button:nth-child(1) {
          flex: 1 1;
          color: #8590a6;
        }
        .el-button:nth-child(2) {
          flex: 1 1;
          background-color: #0084ff;
          color: #fff;

          &.is-disabled {
            opacity: 0.5;
          }
        }
      }
    }
  }
}
</style>
<style lang="css" scoped>
.FavlistsDialog-container >>> .el-dialog__body {
  padding: 0 !important;
}
</style>
