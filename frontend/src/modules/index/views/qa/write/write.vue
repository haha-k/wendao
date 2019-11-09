<template>
  <div class="writeCard">
    <mavon-editor v-model="value" :ishljs="true" @save="handlerSave"></mavon-editor>
  </div>
</template>
<script>
export default {
  name: "writeCard",
  data() {
    return {
      value: ""
    };
  },
  methods: {
      handlerSave(value,reder){

      }
  },
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.writeCard {
  width: 100%;
  height: 100%;
  .v-note-wrapper {
    min-height: 100%;
  }
}
</style>
