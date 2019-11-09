import Layout from '@admin/layout'



export const otherRoutes = [{
        path: '/questions',
        component: Layout,
        redirect: '/questions/index',
        children: [{
            path: 'index',
            component: () => import('@admin/views/sysAdminView/question'),
            name: 'Questions',
            meta: {
                title: '问题管理',
                icon: 'club'
            },
        }]
    },
    {
        path: '/users',
        component: Layout,
        redirect: '/users/index',
        children: [{
            path: 'index',
            component: () => import('@admin/views/sysAdminView/users/index'),
            name: 'Users',
            meta: {
                title: '用户管理',
                icon: 'user'
            },
        }]
    },
    {
        path: '/answers',
        component: Layout,
        redirect: '/answers/index',
        children: [{
            path: 'index',
            component: () => import('@admin/views/sysAdminView/answer'),
            name: 'Answers',
            meta: {
                title: '回答管理',
                icon: 'video'
            },
        }]
    },
    {
        path: '/columns',
        component: Layout,
        redirect: '/Columns/index',
        children: [{
            path: 'index',
            component: () => import('@admin/views/sysAdminView/column'),
            name: 'Columns',
            meta: {
                title: '专栏管理',
                icon: 'video'
            },
        }]
    },
    {
        path: '/articles',
        component: Layout,
        redirect: '/articles/index',
        children: [{
            path: 'index',
            component: () => import('@admin/views/sysAdminView/article'),
            name: 'Articles',
            meta: {
                title: '文章管理',
                icon: 'video'
            },
        }]
    }
]