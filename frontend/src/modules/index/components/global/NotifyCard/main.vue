<template>
  <div class="NotifyCard">
    <el-tabs stretch v-model="activeName">
      <el-tab-pane label="默认" name="first">
        <svg-icon slot="label" icon-class="list-index"></svg-icon>
        <el-table :data="notifyData" style="width: 100%" :show-header="true" max-height="350">
          <el-table-column >
            <template slot-scope="scope">
              <span>
                <span class="actors" v-for="i in scope.row.content.actors" :key="i.name">
                  <router-link :to="scope.row.content.target.link">{{i.name}}</router-link>
                </span>
                &nbsp;{{scope.row.content.verb}}&nbsp;
              </span>
              <span>
                <span v-if="(scope.row.content.target.link).length==0">该内容被删除</span>
                <router-link
                  v-else
                  :to="scope.row.content.target.link"
                >{{scope.row.content.target.text}}</router-link>
              </span>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="关注" name="second">
        <svg-icon slot="label" icon-class="friend-index"></svg-icon>
        <el-table :data="notifyData" style="width: 100%" :show-header="true"  max-height="350"></el-table>
      </el-tab-pane>
      <el-tab-pane label="赞" name="third">
        <svg-icon slot="label" icon-class="like-index"></svg-icon>
        <el-table
          :data="vote_thank_data"
          style="width: 100%"
          :show-header="true"
          max-height="350"
        >
          <el-table-column>
            <template slot-scope="scope">
              <span>
                <span class="actors" v-for="i in scope.row.content.actors" :key="i.name">
                  <router-link :to="scope.row.content.target.link">{{i.name}}</router-link>
                </span>
                &nbsp;{{scope.row.content.verb}}&nbsp;
              </span>
              <span>
                <span v-if="(scope.row.content.target.link).length==0">该内容被删除</span>
                <router-link
                  v-else
                  :to="scope.row.content.target.link"
                >{{scope.row.content.target.text}}</router-link>
              </span>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
    </el-tabs>
    <div class="foot">
      <el-button icon="el-icon-s-tools">设置</el-button>
      <el-button>查看全部通知</el-button>
    </div>
  </div>
</template>
<script>
import { getDefault, getVote_thank } from "#/api/home";

export default {
  name: "NotifyCard",
  data() {
    return {
      notifyData: [],
      data: {},
      vote_thank_data: [],
      follow_data: {},
      activeName: 'first'
    };
  },
  methods: {
    getNotify() {
      getDefault()
        .then(result => {
          let {data} = result.data;
          this.notifyData = data;
        })
        .catch(err => {
          console.log(err);
        });

      getVote_thank()
        .then(result => {
          let {data} = result.data;
          this.vote_thank_data = data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mounted() {
    this.getNotify();
  },
  components: {}
};
</script>
<style lang="scss" scoped>
.NotifyCard {
  .is-active {
    // color:#0084ff;
  }
  font-size: 14px;

  .foot {
    display: flex;
    justify-content: space-between;
  }
  .el-tabs {
    .el-table {
      span.actors:not(:last-child):after {
        content: "\3001";
        color: #0084ff;
      }

      a {
        color: #0084ff;
      }
    }
  }
  .el-button {
    border: none;
    font-size: 14px;
    color: #8590a6;
    font-weight: 600;

    &:hover {
      background: none;
      color: #76839b;
    }
  }

  & :first-child {
    // float: left;
  }

  & :last-child {
    // float: right;
  }
}
</style>
<style scoped>
.NotifyCard >>> .el-tabs__item {
  font-size: 20px !important;
}
/* .el-tab-pane{
    font-size: 20px !important;
  } */
.NotifyCard >>> .el-card__body {
  padding: 0 !important;
  display: flex;
}

.NotifyCard >>> .el-table__header-wrapper{
  display: none !important;
}
</style>
