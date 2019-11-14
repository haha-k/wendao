export default[
        {
            name:"column-home",
            path: '/column/',
            component: ()=>import('@/views/column/columnHome.vue')
        },
        {
            name:"column",
            path: '/column/:id',
            component: ()=>import('@/views/column/column.vue')
        },

]