import router from './router'
import store from './store'
import {
    Message
} from 'element-ui'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import {
    getToken
} from '#/utils/auth'
// import getPageTitle from '@/utils/get-page-title'

NProgress.configure({
    showSpinner: false
});

const whiteList = ['/login', '/auth-redirect']

router.beforeEach(async (to, from, next) => {
    NProgress.start();
    // document.title = getPageTitle(to.meta.title);
    const hasToken = getToken();
    // console.log(hasToken);
    // hasToken = "ssssd";
    if (hasToken) {
        if (to.path === '/login') {
            next({
                path: '/'
            });
            NProgress.done();
        } else {
            const hasRoles = store.getters.roles && store.getters.roles.length > 0;
            if (hasRoles) {
                next()
            } else {
                try {
                    // const clubs = await store.dispatch('user/getClubs');
                    const info = await store.dispatch('user/getInfo');
                    let roles;
                    var clubs = await store.dispatch('user/getClubs');
                    console.log(clubs);
                    if (info.is_superuser) {
                        roles = ["sysAdmin"];
                    } else if (clubs.length == 0) {
                        Message.error("您没有权限登录");
                    } else if (clubs) {
                        // console.log(clubs);
                        roles = ["clubAdmin"];
                    }
                    console.log(roles);
                    if (!roles || roles.length <= 0) {
                        reject('您没有权限登录');
                    }
                    store.commit('user/SET_ROLES', roles);
                    store.commit('user/SET_CLUBS', clubs);
                    // console.log(roles);
                    const accessedRoutes = await store.dispatch('permission/generateRoutes', roles);
                    // console.log(accessedRoutes);
                    router.addRoutes(accessedRoutes);
                    next({
                        ...to,
                        replace: true
                    });
                } catch (error) {
                    await store.dispatch('user/resetToken');
                    // console.log("---");
                    Message.error(error || 'has error');
                    next(`/login?redirect=${to.path}`);
                    NProgress.done();
                }
            }
        }
    } else {
        if (whiteList.indexOf(to.path) !== -1) {
            next();
        } else {
            next(`/login?redirect=${to.path}`);
            NProgress.done();
        }
    }
});

router.afterEach(() => {
    NProgress.done();
})
