// import Vue from 'vue';
// import upperFirst from 'lodash/upperFirst';
// import camelCase from 'lodash/camelCase';

// const requireComponent = require.context('../components/global', true, /\w+\.vue$/);
// requireComponent.keys().forEach(fileName => {
//     const componentConfig = requireComponent(fileName);

//     const componentName = upperFirst(camelCase(fileName.split('/').pop().replace(/\.\w+$/), ''));

//     Vue.component(componentName, componentConfig.default || componentConfig);
// })


import Vue from 'vue'

// 自动加载 global 目录下的 .js 结尾的文件
const componentsContext = require.context('../components/global', true, /\.js$/)

componentsContext.keys().forEach(component => {
  const componentConfig = componentsContext(component)
  const ctrl = componentConfig.default || componentConfig
  console.log(ctrl);
  Vue.component(ctrl.name, ctrl)
})
