/* eslint-disable prettier/prettier */
export default [
  {
    name:"question1",
    path: "/question/:qid",
    component: () => import("@/views/question/question.vue")
  },
  {
      name:"question2",
      path: "/question/:qid/answer/:aid",
      component: () => import("@/views/question/question.vue")
   },

];
