(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-68d58316"],{"0c75":function(t,e,a){"use strict";var n=a("897a"),s=a.n(n);s.a},2820:function(t,e,a){"use strict";a.r(e);var n=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"question"},[a("Header",{staticClass:"qc"}),a("questionCard",{staticClass:"qc",attrs:{qid:t.qid},on:{visable:t.vis}}),t.visables?a("reply",{attrs:{qids:t.qid}}):t._e(),a("el-card",[t._l(t.datas,function(t,e){return a("answerCard",{key:e,attrs:{data:t}})}),a("el-divider"),t.n?a("div",[t._v("\n      暂无回答,\n      "),a("el-link",[t._v("添加回答")])],1):t._e()],2)],1)},s=[],i=a("e858"),o=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"questionCard"},[a("el-row",{staticClass:"bg-purple-dark"},[a("el-col",{attrs:{span:6}},[a("div",{staticClass:"grid-content bg-purple-light"})]),a("el-col",{attrs:{span:12}},[a("div",{staticClass:"grid-content bg-purple-dark"},[t._l(5,function(e){return a("el-tag",{key:e},[t._v("分类"+t._s(e))])}),a("div",{staticClass:"qt"},[t._v(t._s(t.question_title))]),a("el-collapse",{attrs:{accordion:""},model:{value:t.activeName,callback:function(e){t.activeName=e},expression:"activeName"}},[a("el-collapse-item",{attrs:{title:t.title,name:"1"}},[a("div",[t._v(t._s(t.describe))])])],1),a("el-button",{attrs:{type:"primary"}},[t._v("关注问题")]),a("el-button",{attrs:{plain:"",icon:"el-icon-search"},on:{click:t.write}},[t._v("写回答")]),a("el-button",{attrs:{plain:"",icon:"el-icon-search"}},[t._v("邀请回答")])],2)]),a("el-col",{attrs:{span:6}},[a("div",{staticClass:"grid-content bg-purple-light"})])],1)],1)},l=[],r={name:"questionCard",data:function(){return{qid:"",aid:"",question_title:"",title:"显示描述",describe:"无",visable:!0}},methods:{write:function(){console.log("==========="),this.$emit("visable",!0)},getdes:function(){}},mounted:function(){var t=this;this.qid=this.$route.params.qid;var e="http://localhost:8000/api/question/qid/"+this.qid;this.$axios.get(e).then(function(e){t.question_title=e.data[0]["question_content"],t.describe=e.data[0]["question_describe"]}).catch(function(t){console.log(t)})},components:{}},c=r,d=(a("0c75"),a("2877")),u=Object(d["a"])(c,o,l,!1,null,"3f939e02",null),h=u.exports,p=h,m=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"answerCard"},[a("el-row",{staticClass:"bg-purple-dark"},[a("el-col",{attrs:{span:6}},[a("div",{staticClass:"grid-content bg-purple-light"})]),a("el-col",{attrs:{span:12}},[a("div",{staticClass:"grid-content bg-purple-dark"},[a("el-card",[a("div",[t._v(t._s(t.user_name+":"))]),a("div",[t._v(t._s(t.likes+"人赞同了该回答"))]),a("el-divider"),a("div",{staticClass:"mainContent"},[t._v("\n            "+t._s(t.content)+"\n          ")]),a("el-divider"),a("qfooter",{attrs:{data:t.datas}})],1)],1)]),a("el-col",{attrs:{span:6}},[a("div",{staticClass:"grid-content bg-purple-light"})])],1)],1)},v=[],f=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"answerHeader"},[a("el-image",{staticStyle:{width:"10px",height:"10px"},attrs:{src:t.url,fit:t.fill}})],1)},g=[],_={name:"answerHeader",data:function(){return{url:"https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg"}},methods:{},mounted:function(){},components:{}},b=_,q=(a("7a9b"),Object(d["a"])(b,f,g,!1,null,"4c761118",null)),C=q.exports,w=C,k=a("7461"),x={name:"answerCard",data:function(){return{user_name:"haha",likes:0,content:"暂无答案",uid:"",comment:0,datas:{like_count:0,aComment:0}}},props:["data"],methods:{},mounted:function(){var t=this;console.log(this.data),this.likes=this.data["like_count"],this.uid=this.data["uid"],this.content=this.data["answer_content"],this.comment=this.data["comment_count"];var e="http://localhost:8000/api/account/uid/"+this.uid;this.datas["like_count"]=this.likes,this.datas["aComment"]=this.comment,this.$axios.get(e).then(function(e){null==e.data["nickname"]?t.user_name="用户"+e.data["id"]:t.user_name=e.data["nickname"]}).catch(function(t){})},components:{answerHeader:w,qfooter:k["default"]}},$=x,y=(a("ea2a"),Object(d["a"])($,m,v,!1,null,"1a777714",null)),F=y.exports,j=F,E=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",{staticClass:"reply"},[a("el-row",{staticClass:"bg-purple-dark"},[a("el-col",{attrs:{span:6}},[a("div",{staticClass:"grid-content bg-purple-light"})]),a("el-col",{attrs:{span:12}},[a("div",{staticClass:"grid-content bg-purple-light"},[a("el-form",{attrs:{model:t.ruleForm,rules:t.rules}},[a("el-form-item",{attrs:{prop:"title"}},[a("el-input",{attrs:{placeholder:"写回答...",type:"textarea","show-word-limit":"ture",rows:5,autosize:t.sizes,maxlength:"10000"},model:{value:t.ruleForm.content,callback:function(e){t.$set(t.ruleForm,"content",e)},expression:"ruleForm.content"}})],1),a("el-button",{attrs:{icon:"el-icon-s-tools"}},[t._v("设置")]),a("el-button",{attrs:{type:"primary"},on:{click:t.submit}},[t._v("提交回答")])],1)],1)]),a("el-col",{attrs:{span:6}},[a("div",{staticClass:"grid-content bg-purple-light"})])],1)],1)},H=[],O=(a("6b54"),a("28a5"),{name:"reply",data:function(){return{qid:"",sizes:{minRows:4,maxRows:100},ruleForm:{content:""},ruleFormBackup:{content:""},rules:{title:[{validator:this.validateAnswer,trigger:"blur"}]}}},methods:{getCookie:function(t){var e="; "+document.cookie,a=e.split("; "+t+"=");if(2===a.length)return a.pop().split(";").shift()},submit:function(){var t=this,e=localStorage.getItem("user_id"),a="http://localhost:8000/api/answer/a/",n=Math.floor(1e7*Math.random()).toString(10),s="http://localhost:8000/api/answer/aid/"+n+"/count";this.$axios.get(s).then(function(t){t.data.count>0&&(n=Math.floor(1e7*Math.random()).toString(10)),console.log(t.data.count)}).catch(function(t){console.log(t)}),this.$axios.post(a,{qid:this.qid,aid:n,uid:e,answer_content:this.ruleForm["content"]},{headers:{"X-CSRFToken":this.getCookie("csrftoken")}}).then(function(e){t.$message({message:"成功发布回答!!"}),t.$router.go(0)}).catch(function(e){t.$message({message:"很遗憾，发布答案失败!!"})})},validateAnswer:function(t,e,a){a()}},props:["qids"],mounted:function(){console.log(this.qids),this.qid=this.qids},components:{}}),S=O,M=(a("a88b"),Object(d["a"])(S,E,H,!1,null,"9a540d62",null)),z=M.exports,A=z,N={name:"question",data:function(){return{qid:"1",aid:"",datas:[],visables:!1,n:!1}},methods:{vis:function(t){console.log(t),this.visables=t},loadAll:function(){}},components:{Header:i["default"],questionCard:p,answerCard:j,reply:A},mounted:function(){var t=this;this.qid=this.$route.params.qid;var e="http://localhost:8000/api/answer/qid/"+this.qid;this.$axios.get(e).then(function(e){t.datas=e.data,0==e.data.length&&(t.n=!0),console.log(e.data)}).catch(function(t){console.log(t)})}},R=N,J=(a("d0ae"),Object(d["a"])(R,n,s,!1,null,"9338d704",null));e["default"]=J.exports},"3adb":function(t,e,a){},"42d5":function(t,e,a){},"7a9b":function(t,e,a){"use strict";var n=a("42d5"),s=a.n(n);s.a},"897a":function(t,e,a){},a052:function(t,e,a){},a88b:function(t,e,a){"use strict";var n=a("3adb"),s=a.n(n);s.a},d0ae:function(t,e,a){"use strict";var n=a("a052"),s=a.n(n);s.a},d693:function(t,e,a){},ea2a:function(t,e,a){"use strict";var n=a("d693"),s=a.n(n);s.a}}]);
//# sourceMappingURL=chunk-68d58316.047a9589.js.map