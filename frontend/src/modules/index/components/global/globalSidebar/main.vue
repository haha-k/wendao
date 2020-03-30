
<template>
  <div class="globalSidebar">
    <writeCard></writeCard>
    <creator-entrance v-if="isCreator"></creator-entrance>
    <navList></navList>
  </div>
</template>
<script>
import creatorEntrance from "./components/creatorEntrance";
import navList from "./components/navList";
import writeCard from "./components/writeCard";
export default {
  name: "globalSidebar",
  data() {
    return {
      isCreator: false
    };
  },
  methods: {},
  components: {
    creatorEntrance: creatorEntrance,
    writeCard: writeCard,
    navList: navList
  }
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";
.globalSidebar-container {
  flex: 1 1;
  font-size: 14px;
  width: 296px;
}
</style>
