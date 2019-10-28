<template>
  <li class="rootNoChild">
    <div class="CommentItemV2">
      <div>
        <div class="meta">
          <router-link>
            <el-avatar></el-avatar>
          </router-link>
          <router-link></router-link>
          <span class="time"></span>
        </div>
        <div class="metaSibling">
            <div class="content">
                {{comment.content}}
            </div>
            <div class="footer">
                <el-button icon="" :class="{'comment.votes':voted}">{{comment.vote_count?comment.vote_count:"赞"}}</el-button>
                <el-button>回复</el-button>
                <el-button>踩</el-button>
                <el-button>举报</el-button>
            </div>
        </div>
      </div>
    </div>
  </li>
</template>
<script>
export default {
  name: "rootNoChild",
  data() {
    return {
        comment:this.item,
    };
  },
  methods: {},
  mounted() {},
  components: {},
  props: {
      item:Object,
  }
};
</script>
<style lang="scss" scoped>
.rootNoChild {
    .CommentItemV2 {
        outline: none;
        position: relative;
        flex-shrink: 0;
        padding: 12px 20px 10px;
        font-size: 15px;
    }
}
</style>
<style lang="css" scoped>
</style>
