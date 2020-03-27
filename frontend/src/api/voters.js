import request from '#/utils/request';

// /api/v4/answers/814613477/voters
export function getAnswerVoters(aid) {
    // return request({
    //     url: '/answers/:aid/voters',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/voters/voters.json',
        method: "get",
    });
}

