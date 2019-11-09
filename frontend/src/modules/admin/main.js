import Vue from 'vue'
import App from './App.vue'
import router from "@admin/router";
import store from "@admin/store";
import './registerServiceWorker'
import Element from "element-ui"
import 'element-ui/lib/theme-chalk/index.css';
import './permission.js'
import "normalize.css"
import "@/styles/index.scss"
import '#/icons'

Vue.config.productionTip = false

let sizeConfig = {
  size: 'medium'
}

Vue.use(Element,{
    size:sizeConfig['size'] || 'medium'
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#admin");
