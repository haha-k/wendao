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
      name: "questionLater",
      path: "/question/later",
      component: () => import("@/views/home/later.vue")
   },
   {
      name: "answers",
      path: "/question/:qid",
      props: true,
      component: () => import("@/views/qa/answers/answers.vue")
   },
   {
      name: "answerDetail",
      path: "/question/:qid/answer/:aid",
      props: true,
      component: () => import("@/views/qa/answerDetail/answerDetail.vue")
   },


];