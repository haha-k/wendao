<template>
  <div :class="{'has-logo':showLogo}">
    <logo v-if="showLogo" :collapse="isCollapse" />
    <el-scrollbar wrap-class="scrollbar-wrapper">
      <el-menu
        :collapse="isCollapse"
        :background-color="variables.menuBg"
        :text-color="variables.menuText"
        :default-active="activeMenu"
        :unique-opened="false"
        :active-text-color="variables.menuActiveText"
        :collapse-transition="true"
        mode="vertical"
      >
        <sidebar-item
          v-for="route in permission_routes"
          :key="route.path"
          :item="route"
          :base-path="route.path"
        ></sidebar-item>
        <!-- <p>{{permission_routes}}</p> -->
      </el-menu>
    </el-scrollbar>
  </div>
</template>
<script>
import { mapGetters } from "vuex";
import logo from "./logo";
import SidebarItem from "./SidebarItem";
import variables from "@admin/styles/variables.scss";

export default {
  name: "Sidebar",
  data() {
    return {};
  },
  methods: {},
  mounted() {
    console.log("....");

  },
  components: {
    SidebarItem,
    logo
  },
  computed: {
    ...mapGetters([
        'permission_routes',
        'sidebar'
    ]),
    activeMenu() {
      const route = this.$route;
      const { meta, path } = route;
      if (meta.activeMenu) {
        return meta.activeMenu;
      }
      return path;
    },
    variables() {
      return variables;
    },
    showLogo(){
        // return this.$store.state.settings.sidebarLogo
        return true;
    },
    isCollapse() {
      //   return !this.sidebar.opened
      return !this.sidebar.opened;
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
