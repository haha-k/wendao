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