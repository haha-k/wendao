import request from '#/utils/request';

// /api/v4/column
export function getColumn() {
    // return request({
    //     url: '/column',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/column/column.json',
        method: "get",
    });
}

// /api/v4/column/814613477/articles
//æŒ‰æ—¶é—´
export function getColumnById(cid) {
    // return request({
    //     url: '/column/:cid/articles',
    //     method: "get",
    // });
    return request({
        baseURL: '',
        url: '/json/column/article.json',
        method: "get",
    });
}