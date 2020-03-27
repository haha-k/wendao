import request from '#/utils/request';

export function getAnswerDetail(aid) {
    // return request({
    //     url: '/answers/:aid',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/answer/answerDetail.json',
        method: "get",
    });
}


//api/v4/answers/816698264/concerned_upvoters?limit=5&offset=0
export function getConcernedUpvoters(aid) {
    // return request({
    //     url: '/answers/:aid/concerned_upvoters',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/answer/concernVotes.json',
        method: "get",
    });
}