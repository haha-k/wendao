import Vue from "vue";
import App from "./App.vue";
import router from "./router/index";
import global from "./components";
import store from "#/store";
import './plugins/index'
import '#/icons';
import axios from 'axios';
import 'normalize.css';
import "@/styles/index.scss";
import "./assets/icon/iconfont.css";

Vue.prototype.$axios = axios;

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  global,
  render: h => h(App)
}).$mount("#index");
