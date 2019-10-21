import request from '#/utils/request';

export function register(data){
    return request({
        url: '/user/',
        method: "post",
        data
    });
}

export function login(data){
    return request({
        url: '/login/',
        method: "post",
        data
    });
}

export function getUserInfo(){
    return request({
        url: '/user/',
        method: "get",
    });
}

export function updateUserInfo(data){
    return request({
        url: '/user/',
        method: "put",
        data
    });
}


