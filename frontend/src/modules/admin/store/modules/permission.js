import { asyncRoutes, constantRoutes} from '@admin/router'
import {otherRoutes} from '@admin/router/modules/otherRoutes'

const state = {
    routes: undefined,
    addRoutes: []
}

function hasPermission(roles,route){
    if(route.meta && route.meta.roles){
        return roles.some(role => route.meta.roles.includes(role));
    }else{
        return true;
    }
}


export function filterAsyncRoutes(routes,roles){
    const res=[];

    routes.forEach(route => {
        const tmp = {...route};
        if(hasPermission(roles,tmp)){
            if(tmp.children){
                tmp.children = filterAsyncRoutes(tmp.children,roles);
            }
            res.push(tmp);
        }
    });

    return res;
}

const mutations = {
    SET_ROUTES: (state,routes)=>{
        state.routes = routes;
    }
}

const actions =  {
    generateRoutes({commit},roles){
            console.log('permission');

        return new Promise(resolve => {
            let accessedRoutes;
            accessedRoutes = otherRoutes || [];
            console.log(accessedRoutes);

            // if(roles.includes('sysAdmin')){
            //     accessedRoutes = sysAdminRoutes || [];
            //     console.log("hahahahhaha");
            // }else{
            //     accessedRoutes = clubAdminRoutes || [];
            // }
            commit('SET_ROUTES',accessedRoutes);
            resolve(accessedRoutes);
        })
    }
}

export default {
    namespaced: true,
    state,
    mutations,
    actions
}