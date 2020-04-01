export default [{
        name: "collection",
        path: '/collection',
        children: [{
                name: "collectionHot",
                path: 'collection/hot',
                component: () => import('@/views/home/Home.vue')
            },
            {
                name: "collectItem",
                path: '/collection/:cid',
                component: () => import('@/views/home/explore.vue')
            }
        ]
    },

]