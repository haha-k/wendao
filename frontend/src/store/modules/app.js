import {
    getToken,
    setToken,
    removeToken
} from '#/utils/auth';
import {
    login,
} from '#/api/user';
import { resolve } from 'url';
import { reject } from 'q';

const state = {
    token: getToken(),
    avatar: '',
    name: '',
    info: {},
}

const mutations = {
    SET_TOKEN: (state, token) => {
        state.token = token;
    },
    SET_AVATAR: (state, avatar) => {
        state.avatar = avatar;
    },
    SET_NAME: (state, name) => {
        state.name = name;
    },
    SET_INFO: (state, info) => {
        state.info = info;
    },
}

const actions = {
    login({
        commit
    }, userInfo) {
        const {
            username,
            password
        } = userInfo;

        return new Promise((resolve,reject)=> {
            login({
                username: username.trim(),
                password: password,
            }).then(response => {
                const {
                    data
                } = response;
                commit('SET_TOKEN',data.token);
                setToken(data.token);
                resolve('success set token');
            }).catch((err) => {
                reject(err);
            });
        })
    }


}

export default {
    namespaced: true,
    state,
    mutations,
    actions
}