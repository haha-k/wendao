<template>
  <div class="profile-container">
    <el-container>
      <el-header style="height:52px">
        <Navbar></Navbar>
      </el-header>
      <el-main>
        <div>
          <profile-header :me="profile"></profile-header>
          <profile-main :me="profile"></profile-main>
        </div>
      </el-main>
    </el-container>
  </div>
</template> <script>
import ProfileHeader from "./components/header";
import ProfileMain from "./components/main";
import Navbar from "@/components/global/Navbar";
import { getMe } from "#/api/member";
export default {
  name: "profile",
  data() {
    return {
      profile: {},
    };
  },
  methods: {
    getProfile(uid) {
      getMe(uid)
        .then(result => {
          let { data } = result;
          this.profile = data;
          console.log(this.profile);
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
    ProfileHeader: ProfileHeader,
    ProfileMain: ProfileMain,
    Navbar: Navbar
  }
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";
.profile-container {
}
</style>