export default[
        {
            name:"home",
            path: '/home',
            component: ()=>import('@/views/home/Home.vue')
        },
        {
            name:"explore",
            path: '/explore',
            component: ()=>import('@/views/home/explore.vue')
        },

]