/* eslint-disable prettier/prettier */
let objectProject = {
    index: {
        entry:'src/modules/index/main.js',
        template: 'src/modules/index/index.html',
        filename:'index.html',
        title:'问道',
        chunks: ['chunk-vendors', 'chunk-common', 'index']
    },
    admin: {
        entry:'src/modules/admin/main.js',
        template: 'src/modules/admin/admin.html',
        filename:'admin.html',
        title:'问道后台管理系统',
        chunks: ['chunk-vendors', 'chunk-common', 'admin']
    }
}

let page = {}
let projectName = process.argv[3]

if(process.env.NODE_ENV == 'development') {
    page = objectProject
}else {
    page[projectName] = objectProject[projectName]
}


const path = require('path')
const name = "问道"
const port = 8080

function resolve(dir){
    return path.join(__dirname,dir)
}

module.exports = {
    publicPath: '/', // 部署应用时的根路径(默认'/'),也可用相对路径(存在使用限制)
    outputDir: 'dist/'+projectName, // 运行时生成的生产环境构建文件的目录(默认''dist''，构建之前会被清除)
    assetsDir: 'static', //放置生成的静态资源(s、css、img、fonts)的(相对于 outputDir 的)目录(默认'')
    // indexPath: 'index.html', //指定生成的 index.html 的输出路径(相对于 outputDir)也可以是一个绝对路径。
    lintOnSave: process.env.NODE_ENV === 'development', // 是否在保存的时候检查
    pages:page,
    productionSourceMap: false, // 生产环境是否生成 sourceMap 文件
    css: {
        extract: true, // 是否使用css分离插件 ExtractTextPlugin
        sourceMap: true, // 开启 CSS source maps
        loaderOptions: {}, // css预设器配置项
        modules: false // 启用 CSS modules for all css / pre-processor files.
    },
    devServer: { // 环境配置
        host: '127.0.0.1',
        port: port,
        https: false,
        // hotOnly: true,
        open: true, //配置自动启动浏览器
        overlay:{
            warnings:false,
            errors:true,
        },
        proxy: {
            '/api/v1': {
                target: 'http://localhost:8000/api/v1',
                changeOrigin: true,
                pathRewrite: {
                    '^/api/v1': ''
                },
            },
        },
        watchOptions: {
            poll: 1000,
            ignored: /node_modules/,
            aggregateTimeout: 300
        }
    },
    pluginOptions: { // 第三方插件配置
        // ...
    },
    configureWebpack: {
        name: name,
        resolve: {
            alias: {
                '#':resolve('src'),
                '@':resolve('src/modules/index'),
                '@admin':resolve('src/modules/admin'),
            }
        }
    },
    chainWebpack: config => {
        config.plugin('define').tap(args => {
            args[0]['process.env'].BASE_URL = JSON.stringify(process.env.BASE_URL);
            return args;
        });

        config.module
        .rule('svg')
        .exclude.add(resolve('src/icons'))
        .end();

        config.module.rule('icons')
        .test(/\.svg$/)
        .include.add(resolve('src/icons'))
        .end()
        .use('svg-sprite-loader')
        .loader('svg-sprite-loader')
        .options({
            symbolId:'icon-[name]'
        })
        .end()
    }
};