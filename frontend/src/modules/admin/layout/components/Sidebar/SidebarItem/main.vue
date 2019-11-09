<template>
  <div v-if="!item.hidden" class="menu-warpper">
    <template
      v-if="hasOneShowingChild(item.children,item) && (!onlyOneChild.children||onlyOneChild.noShowingChildren) && !item.alwaysShow"
    >
      <app-link v-if="onlyOneChild.meta" :to="resolvePath(onlyOneChild.path)">
        <el-menu-item
          :index="resolvePath(onlyOneChild.path)"
          :class="{'submenu-title-noDropdown':!isNest}"
        >
          <item
            :icon="onlyOneChild.meta.icon || (item.meta&&item.meta.icon)"
            :title="onlyOneChild.meta.title"
          ></item>
        </el-menu-item>
      </app-link>
    </template>
    <el-submenu v-else ref="subMenu" :index="resolvePath(item.path)" popper-append-to-body>
      <template slot="title">
        <item v-if="item.meta" :icon="item.meta && item.meta.icon" :title="item.meta.title"></item>
      </template>
      <sidebar-item
        v-for="child in item.children"
        :key="child.path"
        :is-nest="true"
        :item="child"
        :base-path="resolvePath(child.path)"
        class="nest-menu"
      ></sidebar-item>
    </el-submenu>
  </div>
</template>
<script>
import Item from "../item";
import AppLink from "../Link";
import { isExternal } from "#/utils/validate"
import path from 'path'

export default {
  name: "SidebarItem",
  data() {
    return {
      onlyOneChild: null,
      // it:item,
    };
  },
  methods: {
    hasOneShowingChild(children = [], parent) {
      // console.log(children);
      const showingChildren = children.filter(item => {
        if (item.hidden) {
          return false;
        } else {
          this.onlyOneChild = item;
          return true;
        }
      });



      if (showingChildren.length === 1) {
        return true;
      }

      if (showingChildren.length === 0) {
        this.onlyOneChild = { ...parent, path: "", noShowingChildren: true };
        return true;
      }

      return false;
    },
    resolvePath(routePath) {
      if (isExternal(routePath)) {
        return routePath;
      }
      if (isExternal(this.basePath)) {
        return this.basePath;
      }
      // console.log(this.basePath,routePath);
      return path.resolve(this.basePath, routePath);
    }
  },
  mounted() {
    // console.log(item)
  },
  components: {
    Item,
    AppLink
  },
  props: {
    item: {
      type: Object,
      required: true
    },
    basePath: {
      type: String,
      default: ""
    },
    isNest: {
      type: Boolean,
      default: false
    }
  }
};
</script>
<style lang="scss" scoped>
</style>
