<template>
  <div class="header-container">
    <el-input
      v-model="listQuery.username"
      placeholder="输入关键字(用户名)搜索"
      clearable
      class="filter-item"
      @keyup.enter.native="handleFilter"
      style="width:200px;"
      size="small"
    ></el-input>
    <el-select
      v-model="listQuery.is_active"
      placeholder="账号状态"
      clearable
      style="width:100px"
      class="filter-item"
      size="small"
    >
      <el-option
        v-for="item in statusOptions"
        :key="item.key"
        :label="item.displayName"
        :value="item.key"
      ></el-option>
    </el-select>
    <el-button
      v-waves
      type="primary"
      size="mini"
      @click="handleFilter"
      class="filter-item"
      style="margin-left:10px"
      icon="el-icon-search"
    >搜索</el-button>
    <el-button
      type="primary"
      size="mini"
      @click="$refs.form.dialog = true"
      class="filter-item"
      style="margin-left:10px"
      icon="el-icon-edit"
    >新增</el-button>
    <eForm
    ref="form"
    :is-add="true"
    >

    </eForm>
    <el-button
      type="primary"
      size="mini"
      @click="handleDownload"
      class="filter-item"
      style="margin-left:10px"
      icon="el-icon-download"
    >导出</el-button>
  </div>
</template>
<script>
import eForm from './form';
export default {
  name: "eheader",
  data() {
    return {
      listQuery: {
        page: 1,
        limit: 10,
        username: undefined,
        is_active: undefined
      },
      statusOptions: [
        { key: "true", displayName: "锁定" },
        { key: "false", displayName: "正常" }
      ]
    };
  },
  methods: {
    handleFilter() {
      console.log("TO-DO 处理搜索");
    },
    handleCreate() {
      console.log("TO-DO 处理新建");

    },
    handleDownload() {
      console.log("TO-DO 处理下载导出");
    }
  },
  mounted() {},
  components: {
    eForm:eForm,
  }
};
</script>
<style lang="scss" scoped>
</style>
