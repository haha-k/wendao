const getters = {
    token: state => state.user.token,
    avatar: state => state.user.avatar,
    name: state => state.user.name,
    intro: state => state.user.intro,
    roles: state => state.user.roles,
    sidebar: state => state.app.sidebar,
    size: state => state.app.size,
    device: state => state.app.device,
    // permission_routes: state => state.permission.routes,
}

export default getters