<template>
  <div class="profileEdit-container">
    <el-container>
      <el-header style="height:52px">
        <Navbar></Navbar>
      </el-header>
      <el-main>
        <div class="ProfileEdit">
          <el-card :body-style="{ padding: '0px' }">
            <div class="header">
              <div class="UserCoverEditor">
                <div class="UserCoverGuide">
                  <div class="inner"></div>
                </div>
              </div>
            </div>
            <div class="main">
              <div class="avatar">
                <el-img></el-img>
              </div>
              <div class="content">
                <div class="head">
                  <h1 class="title"></h1>
                </div>
              </div>
            </div>
          </el-card>
        </div>
      </el-main>
    </el-container>
  </div>
</template> <script>
import Navbar from "@/components/global/Navbar";
import { getMe } from "#/api/member";
export default {
  name: "profile",
  data() {
    return {
      profile: {}
    };
  },
  methods: {
    getProfile(uid) {
      getMe(uid)
        .then(result => {
          let { data } = result;
          this.profile = data;
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  created() {
    this.getProfile(this.$route.uid);
  },
  mounted() {},
  components: {
    Navbar: Navbar
  }
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";
.profile-container {
}
</style>