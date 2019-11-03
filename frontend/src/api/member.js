// /api/v4/members/h2pl
import request from '#/utils/request';

export function getMember(uid) {
    // return request({
    //     url: '/members/:uid',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: 'json/member/member.json',
        method: "get",
    });
}

export function getMe(uid) {
    // return request({
    //     url: '/me/:uid',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: 'json/member/me.json',
        method: "get",
    });
}