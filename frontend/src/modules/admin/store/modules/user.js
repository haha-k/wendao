import {
    login,
    getInfo,
    getUserClubs,
} from '#/api/user'
import {
    getToken,
    setToken,
    removeToken
} from '#/utils/auth'
import getters from '../getters';

const state = {
    token: getToken(),
    avatar: '',
    name: '',
    info: {},
    roles: [],
    id: 0,
    clubs:[],
}

const mutations = {
    SET_TOKEN: (state, token) => {
        state.token = token
    },
    SET_INFO: (state, info) => {
        state.info = info
    },
    SET_NAME: (state, name) => {
        state.name = name
    },
    SET_AVATAR: (state, avatar) => {
        state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
        state.roles = roles
    },
    SET_ID: (state, id) => {
        state.id = id
    },
    SET_CLUBS: (state, clubs) => {
        state.clubs = clubs
    }
}

const actions = {
    // set_roles({commit},roles){
    //     commit('SET_ROLES', '')
    // },
    //user login
    login({
        commit
    }, userInfo) {
        const {
            username,
            password
        } = userInfo;
        // console.log(userInfo);
        return new Promise((resolve, reject) => {
            login({
                username: username.trim(),
                password: password,
            }).then(response => {
                const {
                    data
                } = response;
                commit('SET_TOKEN', data.token);
                setToken(data.token);
                resolve('success set token');

            }).catch(error => {
                // console.log("????");
                reject(error);
            })
        })
    },

    getClubs({
        commit,
        state
    }) {
        return new Promise((resolve, reject) => {
            getUserClubs(state.id).then((result) => {
                // console.log(result.data);
                resolve(result.data);
            }).catch((err) => {
                reject(err);
            });

        })
    },

    //get user info
    getInfo({
        commit,
        state
    }) {
        return new Promise((resolve, reject) => {

            getInfo().then(response => {
                const {
                    data
                } = response;
                if (!data) {
                    reject('验证失败,请再次登录');
                }
                const {
                    // roles,
                    avatar_url,
                    username,
                    id,
                    ...info
                } = data;
                // console.log(info);

                // let a = async () => {
                //     console.log("-----")
                //     var x = await getClubs();
                //     console.log(x);
                // }
                // a();

                let roles;


                // commit('SET_ROLES', roles);
                commit('SET_NAME', username);
                commit('SET_AVATAR', avatar_url);
                commit('SET_INFO', info);
                commit('SET_ID', id);

                resolve(info);
            }).catch(error => {
                reject(error);
            })
        })
    },


    //user logout
    logout({
        commit,
        state
    }) {
        commit('SET_TOKEN', '');
        commit('SET_ROLES', []);
        removeToken();
    },
    resetToken({
        commit
    }) {
        return new Promise((resolve, reject) => {
            commit('SET_TOKEN', '');
            commit('SET_ROLES', []);
            removeToken();
            resolve();
        })
    }

}

export default {
    namespaced: true,
    state,
    mutations,
    actions
};
