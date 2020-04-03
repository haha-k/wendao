<template>
  <div class="column">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'explore'"></Navbar>
      </el-header>
      <el-main class="App-main">
        <div class="collection-detail">
          <section class="mainColumn">
            <collection-header :authorInfo="authorInfo" :favlist="favlist"></collection-header>
            <el-card :body-style="{ padding: '0 20px' }">
              <div slot="header">
                <span>{{favlist.total_count}}个内容</span>
              </div>
              <info-card v-for="(item,index) in favItem" :key="index" :item="item.content"></info-card>
              <footer class="footer">
                <el-pagination layout="prev, pager, next" :total="50"></el-pagination>
              </footer>
            </el-card>
          </section>
          <aside class="sidebar"></aside>
        </div>
      </el-main>
    </el-container>
  </div>
</template>
<script>
import Navbar from "@/components/global/Navbar";
import { getFavlistItem, getFavlistInfo } from "#/api/favlists";
import { FormatterDate } from "#/utils/common";
import CollectionHeader from "./components/header";
export default {
  name: "collection",
  data() {
    return {
      favlist: {},
      favItem: [],
      authorInfo: {}
    };
  },
  computed: {
    createdTime() {
      return FormatterDate(this.favlist.created);
    }
  },
  methods: {
    getLists(fid) {
      getFavlistInfo(fid)
        .then(result => {
          this.favlist = result.data.data;
          this.authorInfo = this.favlist.creator;
          this.favItem = this.favlist.favitems;
        })
        .catch(err => {});
    }
  },
  mounted() {
    this.getLists(this.cid);
  },
  beforeDestroyed() {},
  created() {
    // this.$nextTick(this.getLists(this.cid));
  },
  components: {
    Navbar: Navbar,
    CollectionHeader: CollectionHeader
  },
  props: ["cid"]
};
</script>
<style lang="scss" scoped>
.column {
  .App-main {
    margin: 0;
    padding: 0;
    width: 100%;

    .collection-detail {
      width: 1000px;
      margin: 10px auto;
      margin-top: 62px;
      padding: 0 16px;
      display: flex;
      overflow: hidden;

      .mainColumn {
        width: 694px;

        .footer {
          padding: 16px 20px;
        }
      }
    }
  }
}
</style>

<style scoped>
[v-cloak] {
  display: none !important;
}
.mainColumn >>> .el-card .el-card__header {
  height: 50px;
  text-align: left;
  padding: 0 20px;
  display: flex;
  justify-content: start;
  align-items: center;
  font-weight: 400;
  border-bottom: 1px solid #f6f6f6;
}
</style>
