import variables from '@admin/styles/element-variables.scss'
import defaultSettings from '@admin/settings'

const {
    showSettings,
    tagsView,
    fixedHeader,
    sidebarLogo
} = defaultSettings

const state = {
    theme: variables.theme,
    showSettings: showSettings,
    tagsView: tagsView,
    fixedHeader: fixedHeader,
    sidebarLogo: sidebarLogo
};

const mutations = {

};

const actions = {

};

export default {
    namespaced: true,
    state,
    mutations,
    actions
}
