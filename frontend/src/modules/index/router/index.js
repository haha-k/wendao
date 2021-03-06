// components/index.js
import Vue from "vue";
import Router from "vue-router";
import NProgress from 'nprogress'

Vue.use(Router);

let routes = [];
const routerContext = require.context("./", true, /index\.js$/);

routerContext.keys().forEach(route => {
  if (route.startsWith("./index")) {
    return;
  }
  const routerModule = routerContext(route);
  /**
   * 兼容 import export 和 require module.export 两种规范
   */
  routes = [...routes, ...(routerModule.default || routerModule)];
});


const router = new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: routes
});

router.beforeEach((to, from, next) => {
  NProgress.start();
  next();
});

router.afterEach((to, from) => {
  NProgress.done();
  NProgress.remove();
});

export default router;