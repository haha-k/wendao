<template>
  <component v-bind="linkProps(to)">
    <slot />
  </component>
</template>
<script>
import { isExternal } from '#/utils/validate'

export default {
  name: 'Link',
  data(){
    return{

    }
  },
  methods:{
    linkProps(url){
      if(isExternal(url)){
        return {
          is: 'a',
          href:url,
          target:'_blank',
          rel: 'noopener'
        }
      }
      return{
        is:'router-link',
        to:url
      }
    }
  },
  mounted(){

  },
  components: {

  },
  props:{
    to:{
      type:String,
      required:true
    }
  }

}
</script>
<style lang="scss" scoped>
</style>
