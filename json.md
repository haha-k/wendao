### 登录

/api/v1/login

/login

### 个人资料

/api/v1/people/self

- /people/xxxx/activities      我的动态

- /people/xxxx/answers       我的回答

- /people/xxxx/asks              我的提问

- /people/xxxx/posts            我的文章

- /people/xxxx/columns       我的专栏

- /people/xxxx/collections   我的收藏夹

- /people/xxxx/following      我的关注
  - /people/xxxx/followers   关注我的人
  - /people/xxxx/following   我关注的人
  - /people/xxxx/following/columns   我关注的专栏
  - /people/xxxx/following/topics        我关注的话题
  - /people/xxxx/following/questions        我关注的问题
  - /people/xxxx/following/collections        我关注的收藏

- /people/edit                    编辑我的资料

### 首页

- /follow           关注
- /hot                热榜
- /                      推荐

### 发现

##### 热门回答

/api/v1/explore/answers

##### 热门收藏

/api/v1/explore/collections

##### 随便看看

/api/v1/explore/random_question

- /explore         发现

### 等你来答

- /question/waiting      等你来答    （人气问题）
- ?type=potential         (潜力好问)
- ?type=new                  (新问题)
- ?type=everyone         (人人答)

### 设置

- settings/account        账号与密码
- settings/notification  消息与邮件
- settings/filter              屏蔽
- settings/privacy          隐私
- settings/preference   偏好设置

### 创作者中心

##### 主页

- /creator          主页

##### 统计

- /creator/analytics/work/answers   统计-回答
- /creator/analytics/work/articles   统计-文章

##### 功能

- /creator/tools/question/recommend     问题推荐

- /creator/tools/question/new                   最新问题

- /creator/tools/question/invited              邀请回答



### 通知

/notifications

### 私信

/api/v1/inbox

/messages

### 收藏夹

/collections               我关注的收藏夹

/collections/mine     我创建的收藏夹



### 问题
GET /api/v1/questions/xxxx
```json
{
"type": "question",   //类型：（问题）
"id": 338925236,   //id
"title": "如果你是虐文里的女主你会怎么办？", //标题
"question_type": "normal", //问题类型
"created": 1565053122,  //创建时间
"updated_time": 1570417795,  //更新时间
"url": "https://www.zhihu.com/api/v4/questions/338925236",  //url
"relationship": {}
}
```

GET   /api/v1/questions/xxx/answers

```json
"data":[
    {
    "id": 124608455, //id
    "type": "answer",  //类型:(回答)
    "answer_type": "normal",
    "question": {
        "type": "question",  // 类型(问题)
        "id": 51196509,   //id
        "title": "现任在一起时间不长，提出同居，我说租两室一厅，然后吵架，他的意思，要不一室要不分手。直接分手还是？",  //
        "question_type": "normal",
        "created": 1475375737,   //创建日期
        "updated_time": 1475919318,  //更新日期
        "url": "https://www.zhihu.com/api/v4/questions/51196509",    //url
        "excerpt": "）男方大我7岁。性格有点偏小孩。", //描述
        "detail": "）男方大我7岁。性格有点偏小孩。不是因",  //详细
        "relationship": {
        },
        "is_labeled": false   //
    },
    "author": {
        "id": "bce85223279ab8961e2da51fe167b74a", //id
        "url_token": "dou-ding-qi-qi",  //url
        "name": "豆丁七七",   //昵称
        "avatar_url": "https://pic2.zhimg.com/a5be22a4e24286853602b06ff2d73f09_is.jpg", //头像地址
        "avatar_url_template": "https://pic2.zhimg.com/a5be22a4e24286853602b06ff2d73f09_{size}.jpg",  //头像缩略图地址
        "is_org": false,  //是否是组织号
        "type": "people", //类型（用户）
        "url": "https://www.zhihu.com/api/v4/people/bce85223279ab8961e2da51fe167b74a", //用户
        "user_type": "people",  //用户类型
        "headline": " ️", //一句话描述
        "badge": [], //徽章
        "gender": 0, //性别
        "is_advertiser": false,  //广告账号
        "is_followed": false,  //
        "is_privacy": false  //是否私有
    },
    "url": "https://www.zhihu.com/api/v4/answers/124608455",  //url
    "is_collapsed": false,  //是否折叠
    "created_time": 1475391629,   //创建时间
    "updated_time": 1475391629,    //更新时间
    "extras": "",   //附加物
    "is_copyable": true,  //是否可复制
    "is_normal": true,  //
    "voteup_count": 0,  //赞数
    "comment_count": 3,   //评论数
    "is_sticky": false,
    "admin_closed_comment": false,  //管理员关闭评论
    "comment_permission": "all",  // "评论权限"  (all:允许所有人评论  censor:评论由我筛选后显示  followee:关注的人  nobody:不允许评论)
    "can_comment": {
        "reason": "",
        "status": true
    },  //"可以评论"
    "reshipment_settings": "allowed",  //转载设置  (allowed: 允许  disallowed: 不允许)
    "content": "分手。<br/>如果你现在不拒绝，以后有得你哭的。<br/>我也是个不太会拒绝的人，但是我知道，感情的事一辈子的事，所以要考虑清楚。",  //回答内容
    "editable_content": "", //可修改内容
    "collapsed_by": "nobody", //被谁折叠
    "collapse_reason": "",  //折叠原因
    "annotation_action": null,  //注释行为
    "relevant_info": {
        "is_relevant": false,
        "relevant_type": "",
        "relevant_text": ""
    },  //相关信息
    "suggest_edit": {
        "reason": "",
        "status": false,
        "tip": "",
        "title": "",
        "unnormal_details": {
            "status": "",
            "description": "",
            "reason": "",
            "reason_id": 0,
            "note": ""
        },  //不正常细节
        "url": ""
    },//建议修改
    "reward_info": {
        "can_open_reward": false,
        "is_rewardable": false,
        "reward_member_count": 0,
        "reward_total_money": 0,
        "tagline": ""
    },  //奖励信息
    "review_info":{"is_reviewing":false,"tips":"","type":""}, //审核信息
    "relationship": {
        "is_author": false,  //关系  是否为作者？
        "is_authorized": false,  //是否授权
        "is_nothelp": false,  //是否没有帮助
        "is_recognized": false,  //是否认可
        "is_thanked": false,  //是否感谢
        "upvoted_followees": [],  //点赞中关注的人
        "voting": 0  //赞同
    }
}
]
```

GET /api/v1/answers/781919188/voters  获得点赞列表


```json
{
"data": [
{
"is_followed": false, //是否关注
"avatar_url_template": "https://pic4.zhimg.com/v2-6ca82584be4bffcb979c08f42fdb4637_{size}.jpg", //头像缩略图
"badge": [],  //徽章
"name": "郭大胖",  //昵称
"headline": "",  //一句话
"gender": -1, //性别
"user_type": "people",  //用户类型
"is_advertiser": false,  //是否为广告号
"avatar_url": "https://pic4.zhimg.com/v2-6ca82584be4bffcb979c08f42fdb4637_is.jpg",  //头像url
"url": "http://www.zhihu.com/api/v4/people/18ecdb3b0d8b1235fb5757464b2d393f",  //url
"type": "people",  //类型
"url_token": "guo-xue-jing-1",   //url-token
"id": "18ecdb3b0d8b1235fb5757464b2d393f",  //uid
"is_org": false,  //是否为组织号
"answer_count": 10, //回答数
"articles_count": 0, //文章数
"follower_count": 25, //粉丝数

}
],
}
```

GET /api/v1/answers/781919188/commits  获得评论列表
```json
{
    "featured_counts": 0,  //
    "common_counts": 1,  //总条数
    "collapsed_counts": 0, //折叠数
    "reviewing_counts": 0, //审核数
    "data":
    [
        {
            "id": 754464692,  //id
            "type": "comment", //类型
            "url": "https://www.zhihu.com/api/v4/comments/754464692",
            "content": "<p>xxx</p>",
            "featured": false,
            "collapsed": false,  //是否折叠
            "is_author": true,  //是否为作者
            "is_delete": false,  //是否已经删除
            "created_time": 1570584354, //创建时间
            "resource_type": "answer", //评论类型
            "reviewing": false, //审核中
            "allow_like": false, //允许赞
            "allow_delete": true, //允许删除
            "allow_reply": true, //允许回复
            "allow_vote": false, //允许赞
            "can_recommend": true, //可以提醒
            "can_collapse": true, //可以折叠
            "author": {
            "role": "normal",
        "member": {
            "id": "5f0bc375a03ab717c09e09496979674f",
            "url_token": "OuO_",
            "name": "g2384",
            "avatar_url": "https://pic4.zhimg.com/dc6e23c9a800d50c0525114ac1e179ea_r.jpg",
            "avatar_url_template": "https://pic4.zhimg.com/dc6e23c9a800d50c0525114ac1e179ea_{size}.jpg",
            "is_org": false,
            "type": "people",
            "url": "https://www.zhihu.com/people/5f0bc375a03ab717c09e09496979674f",
            "user_type": "people",
            "headline": "各种爱好者",
            "badge": [],
            "gender": 1,
            "is_advertiser": false
        }
    },
    "vote_count": 0,
    "voting": false,
    "disliked": false,
    "censor_status": 0,
    "child_comment_count": 4,
    "child_comments": [
        {
            "id": 54652668,
            "type": "comment",
            "url": "https://www.zhihu.com/comments/54652668",
            "content": "您好，这些接口没有开放的文档，是我个人测试出来的。由于知乎日报的评论功能和微博关联，而且其中又有很大一部分无用的信息，所以我没有测试他的接口。如果可以，您可以自行测试～",
            "featured": false,
            "collapsed": false,
            "is_author": false,
            "is_delete": false,
            "created_time": 1397866395,
            "resource_type": "answer",
            "reviewing": false,
            "allow_like": true,
            "allow_delete": false,
            "allow_reply": true,
            "allow_vote": true,
            "can_recommend": false,
            "can_collapse": false,
            "author": {
                "role": "author",
                "member": {
                    "id": "0",
                    "url_token": "",
                    "name": "匿名用户",
                    "avatar_url": "https://pic1.zhimg.com/aadd7b895_r.jpg",
                    "avatar_url_template": "https://pic1.zhimg.com/aadd7b895_{size}.jpg",
                    "is_org": false,
                    "type": "people",
                    "url": "https://www.zhihu.com/people/0",
                    "user_type": "people",
                    "headline": "",
                    "badge": [],
                    "gender": -1,
                    "is_advertiser": false
                }
            },
            "vote_count": 1,
            "reply_to_author": {
                "role": "normal",
                "member": {
                    "id": "5f0bc375a03ab717c09e09496979674f",
                    "url_token": "OuO_",
                    "name": "g2384",
                    "avatar_url": "https://pic4.zhimg.com/dc6e23c9a800d50c0525114ac1e179ea_r.jpg",
                    "avatar_url_template": "https://pic4.zhimg.com/dc6e23c9a800d50c0525114ac1e179ea_{size}.jpg",
                    "is_org": false,
                    "type": "people",
                    "url": "https://www.zhihu.com/people/5f0bc375a03ab717c09e09496979674f",
                    "user_type": "people",
                    "headline": "各种爱好者",
                    "badge": [],
                    "gender": 1,
                    "is_advertiser": false
                }
            },
            "voting": false,
            "disliked": false,
            "censor_status": 0
        },
    ]
}
    ]
}

```



/question/348716054/answer/845472906       某问题的某回答

/question/348716054                                           某问题(默认排序)

/question/348716054/answers/updated          某问题(按时间排序)

/question/later                                                       我的稍后答

### 回答



### 专栏

/column/xxx        专栏

/column/request         申请创建专栏



### 文章

/p/xxxx   文章

/p/xxxx/comments   文章评论

/p/write              写文章

### 社区服务中心

/community       我的举报

/community/reported       违规记录



### 话题

/topic/20759032/intro                              简介

/topic/20759032/hot                                讨论

/topic/20759032/top-answers                精华

/topic/20759032/unanswered                讨论

/topic/20759032/questions                     所有问题

/topic/20759032/followers                      关注该话题的人



### 未读消息数量

/api/v1/unread_count

### 最新动态

/api/v1/feeds

### 消息内容

/notifications/content

### 与我相关

/notifications/love



