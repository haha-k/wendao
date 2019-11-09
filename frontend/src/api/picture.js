import request from '@/utils/request'

export function addPic(data) {
    return request({
        url: '/pictures/',
        method: "post",
        data
    });
}
export function getPics(page) {
    return request({
        url: '/pictures/',
        method: "get",
        params: {
            'page':page
        }
    });
}

export function getPicDetail(id){
    return request({
        url: '/pictures/'+id+'/',
        method: "get"
    })
}

export function updatePic(id){
    return request({
        url: '/pictures/'+id+'/',
        method: "put"
    })
}

export function deletePic(id){
    return request({
        url: '/pictures/'+id+'/',
        method: "delete"
    })
}