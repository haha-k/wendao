import request from '#/utils/request';

///api/v4/questions/344204972/followers
export function getQuestionFollowers(qid) {
    // return request({
    //     url: '/questions/:qid/followers',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: 'json/followers/followers.json',
        method: "get",
    });
}
