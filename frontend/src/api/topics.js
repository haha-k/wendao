import request from '#/utils/request';

export function getTopic(tid) {
    // return request({
    //     url: '/topics/:tid',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: 'json/topics/topics.json',
        method: "get",
    });
}