<template>
<div class="writeCard">
  <mavon-editor v-model="value" :ishljs="true"></mavon-editor>
</div>
</template>
<script>
export default {
  name: 'writeCard',
  data(){
    return{
      value:"",
    }
  },
  methods:{

  },
  mounted(){

  },
  components: {

  }
}
</script>
<style lang="scss" scoped>
.writeCard {
}
</style>
