import Vue from "vue";
import App from "./App.vue";
import router from "./router/index";
import global from "./components";
import store from "./store";
import ElementUI from "element-ui";
import axios from 'axios';
import "element-ui/lib/theme-chalk/index.css";

Vue.prototype.$axios = axios;

Vue.config.productionTip = false;
Vue.use(ElementUI);

new Vue({
  router,
  store,
  global,
  render: h => h(App)
}).$mount("#app");
