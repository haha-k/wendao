import axios from 'axios';
import {
    Message
} from 'element-ui';
import store from '@admin/store';
import {
    getToken
} from '#/utils/auth';


const service = axios.create({
    baseURL: '/api/v1',
    // baseURL: '',
    timeout: 5000
});

service.interceptors.request.use(config => {
    if (store.getters.token) {
        config.headers['Authorization'] = 'JWT ' + getToken();
    }
    return config;
}, err => {
    return Promise.reject
})

service.interceptors.response.use(response => {
    console.log(response);
    const responseCode = response.status;
    if (responseCode === 200) {
        return Promise.resolve(response);
    } else {
        return Promise.reject(response);
    }
}, err => {
    if (!error.response) {
        if (error.message.includes['timeout']) {
            console.log("超时了");
            Message.error('请求超时，请检查网络连接');
        } else {
            console.log("断网了");
            Message.error('请求失败，请检查网络连接');
        }
        return;
    }

    const responseCode = error.response.status

    switch (responseCode) {
        case 401:
            //需要身份验证
            router.replace({
                path: '/login',
                query: {
                    redirect: router.currentRoute.fullPath,
                }
            })
            break;
        case 403:
            //无权限
            break;
        case 404:
            //TODO set static 404-errPage-html
            Message({
                message: '没有该资源'
            });
            break;
        default:
            Message({
                message: '发生内部错误',
                type: 'error'
            })
    }
    return Promise.reject(error);
});

export default service