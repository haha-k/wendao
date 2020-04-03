/* eslint-disable prettier/prettier */
export default [{
      name: "write",
      path: "/write",
      component: () => import("@/views/qa/write/write.vue")
   },
   {
      name: "questionWaiting",
      path: "/waiting",
      component: () => import("@/views/home/waiting.vue")
   },

   {
      name: "question",
      path: "/question",
      component: {
         render: h => h('router-view')
      },
      children: [{
            name: "questionLater",
            path: "later",
            component: () => import("@/views/home/later.vue")
         },
         {
            name: "answers",
            path: ":qid/answers",
            props: true,
            // component: () => import("@/views/qa/answers/answers.vue"),
            component: () => import("@/views/qa/answerDetail/answerDetail.vue")
         },
         {
            name: "answerDetail",
            path: ":qid/answer/:aid",
            props: true,
            component: () => import("@/views/qa/answerDetail/answerDetail.vue")
         },
      ]
   },


];