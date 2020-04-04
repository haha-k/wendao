import Vue from "vue";
import App from "./App.vue";
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import router from "./router/index";
import global from "./components";
import store from "#/store";
import mavonEditor from 'mavon-editor';
import 'mavon-editor/dist/css/index.css'
import './plugins/index'
import '#/icons';
import axios from 'axios';
import 'normalize.css';
import 'animate.css';
import "@/styles/index.scss";
import "./assets/icon/iconfont.css";

Vue.prototype.$axios = axios;

Vue.config.productionTip = false;
Vue.use(mavonEditor);
// import infiniteScroll from "vue-infinite-scroll";
// Vue.use(infiniteScroll);

new Vue({
  router,
  store,
  global,
  render: h => h(App)
}).$mount("#index");