import request from '#/utils/request';

export function getRecommend() {
    // return request({
    //     url: '/feed/topstory/recommend/',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: 'json/home/recommend.json',
        method: "get",
    });
}

//   /api/v4/notifications/v2/vote_thank
export function getVote_thank(){
    // return request({
    //     url: 'notifications/vote_thank/',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: 'json/home/vote_thank.json',
        method: "get",
    });
}

export function getDefault(){
    // return request({
    //     url: 'notifications//default/',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: 'json/home/default.json',
        method: "get",
    });
}

// export {
//     notification,
//     vote_thank,
//     // recommend,
// };