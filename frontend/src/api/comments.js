import request from '#/utils/request';

// /api/v4/questions/344204972/root_comments
export function getQuestionRootComment(qid) {
    // return request({
    //     url: '/questions/:qid/root_comments',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/comments/rootcomments.json',
        method: "get",
    });
}

// /api/v4/answers/814613477/comments
//按时间
export function getAnswerComments(aid) {
    // return request({
    //     url: '/answers/:aid/comments',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/comments/comments.json',
        method: "get",
    });
}