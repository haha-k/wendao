export default [{
        name: "article",
        path: '/article/:pid',
        props: true,
        component: () => import('@/views/article/article.vue')
    },

]