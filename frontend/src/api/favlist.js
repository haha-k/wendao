import request from '#/utils/request';

// /api/v4/answers/814613477/relations/collected?favlist_ids=%5B431865594%2C431540302%2C431557096%2C431740462%2C423084808%5D"
export function getCollected(aid) {
    // return request({
    //     url: '/answers/:aid/relations/collected',
    //     method: "get",
            // param:""
    // });
    return request({
        baseURL: '',
        url: '/json/favlist/collected.json',
        method: "get",
    });
}


// /api/v4/members/haha-11-7-20/favlists
export function getFavlists(uid) {
    // return request({
    //     url: '/members/:uid/favlists',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/favlist/favlists.json',
        method: "get",
    });
}