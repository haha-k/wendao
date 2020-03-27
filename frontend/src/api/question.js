import request from '#/utils/request';

export function getQuestionDetail(qid){
    // return request({
    //     url: '/question/:qid',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/question/question.json',
        method: "get",
    });
}

export function ask(data){
    return request({
        url: '/question/',
        method: "post",
        data
    });
}

export function getQuestions(){
    return request({
        url: '/question/',
        method: "get",
    });
}

export function updateUserInfo(data,id){
    return request({
        url: '/question/',
        method: "put",
        data
    });
}
