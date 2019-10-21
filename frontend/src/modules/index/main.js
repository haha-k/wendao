import Vue from "vue";
import App from "./App.vue";
import router from "./router/index";
import global from "./components";
import store from "#/store";
import '#/icons';
import 'normalize.css';
import Element from "element-ui";
import axios from 'axios';
import "element-ui/lib/theme-chalk/index.css";
import "@/styles/index.scss";

Vue.prototype.$axios = axios;

Vue.config.productionTip = false;
let sizeConfig = {
  size: 'medium'
}

Vue.use(Element,{
    size:sizeConfig['size'] || 'medium'
});

new Vue({
  router,
  store,
  global,
  render: h => h(App)
}).$mount("#index");
