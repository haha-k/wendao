/* eslint-disable prettier/prettier */
export default [
  {
    name:"answers",
    path: "/question/:qid",
    component: () => import("@/views/qa/answers/answers.vue")
  },
  {
      name:"answerDetail",
      path: "/question/:qid/answer/:aid",
      component: () => import("@/views/qa/answerDetail/answerDetail.vue")
   },

];
