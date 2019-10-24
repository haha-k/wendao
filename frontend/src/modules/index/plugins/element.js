import Vue from 'vue';
import Element from "element-ui";
import "element-ui/lib/theme-chalk/index.css";


let sizeConfig = {
  size: 'medium'
}

Vue.use(Element,{
    size:sizeConfig['size'] || 'medium'
});