export default [{
        name: "collection",
        path: '/collection',
        component: {
            render: h => h('router-view')
        },
        children: [{
                name: "collectionHot",
                path: 'hot',
                component: () => import('@/views/collection/hot.vue')
            },
            {
                name: "collectItem",
                path: ':cid',
                props: true,
                component: () => import('@/views/collection/collection.vue')
            }
        ]
    },

]