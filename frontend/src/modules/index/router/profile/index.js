export default [{
    name: "profile",
    path: "/profile/edit",
    component: () => import("@/views/profile/edit/edit.vue")
  },
  {
    name: "people",
    path: "/people/:uid",
    props: true,
    component: () => import("@/views/profile")
  },


];