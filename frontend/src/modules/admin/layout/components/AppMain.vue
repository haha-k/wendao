<template>
    <section class="app-main">
        <transition name="fade-transform" mode="out-in">
            <!-- *******to-do -->
            <router-view :key="key"></router-view>
        </transition>

    </section>
</template>
<script>

export default {
  name: 'AppMain',
  data(){
    return{

    }
  },
  methods:{

  },
  mounted(){

  },
  components: {
  },
  computed: {
      key(){
        //   console.log(t0000000000000000his.$route.path);
          return this.$route.path;
      }
  }
}
</script>
<style lang="scss" scoped>
.app-main {
    min-height: calc(100vh - 50px);
    width: 100%;
    position: relative;
    overflow: hidden;
}

</style>

<style lang="scss">
.el-popup-parent--hidden{
    .fixed-header{
        padding-right: 15px;
    }
}
</style>
