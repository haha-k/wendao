<template>
  <div class="app-container">
    <eHeader></eHeader>
    <el-table
      size="small"
      v-loading="loading"
      :data="list"
      border
      stripe
      highlight-current-row
      style="width:100%"
      @sort-change="sortChange"
    >
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column sortable prop="id" label="ID" width="60px" align="center"></el-table-column>
      <el-table-column label="头像" width="50px">
        <template slot-scope="scope">
          <!-- <img :src="scope.row.image" class="el-avatar"> -->
          <img src class="el-avatar" />
        </template>
      </el-table-column>
      <el-table-column align="center" label="用户名" width="150px" sortable>
        <template slot-scope="scope">
          <span class="link-type">{{scope.row.username}}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="telephone" label="手机号码" width="100px"></el-table-column>
      <el-table-column align="center" prop="email" label="邮箱" width="150px"></el-table-column>
      <el-table-column
        align="center"
        prop="gender"
        :formatter="genderFormat"
        label="性别"
        width="50px"
      ></el-table-column>
      <el-table-column align="center" prop="birthdate" label="生日" width="110px"></el-table-column>
      <el-table-column align="center" prop="nickname" label="昵称" width="100px"></el-table-column>
      <el-table-column align="center" prop label="角色" width="70px"></el-table-column>
      <el-table-column align="center" prop="days_since_joined" label="注册天数" width="70px"></el-table-column>
      <el-table-column align="center" label="状态" width="90px">
        <template slot-scope="scope">
          <el-tag :type="scope.row.is_active | statusFilter">{{scope.row.is_active? '激活':'锁定'}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="last_login" label="上次登录" width="140px"></el-table-column>
      <el-table-column align="center" label="操作">
        <template slot-scope="scope">
          <edit :data="scope.row"></edit>
          <!-- v-if="checkPermission(['admin'])" -->
          <update-pass :data="scope.row"></update-pass>
          <el-popover :ref="scope.row.id" placement="top" width="180" style="margin-left:3px">
            <p>确定删除本条数据吗？所有关联的数据将会被清除</p>
            <div style="text-align:right;margin:0">
              <el-button type="text" @click="$refs[scope.row.id].doClose()">取消</el-button>
              <el-button type="primary" @click="subDelete(scope.row.id)">确定</el-button>
            </div>
            <el-button slot="reference" :disabled="scope.row.id === 1" type="danger" size="mini">删除</el-button>
          </el-popover>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      background
      :total="total"
      :page-size="10"
      :current-page.sync="page"
      @next-click="page++"
      @prev-click="page--"
      @current-change="handleChange"
      style="margin-top: 8px;"
      layout="total, prev, pager, next, jumper"
    />
  </div>
</template>
<script>
import eHeader from "./modules/header";
import checkPermission from "#/utils/permission";
import edit from "./modules/edit";
import updatePass from "./modules/updatePass";
// import users from "./mock/user";
import { getUsers } from "#/api/user";

export default {
  name: "users",
  data() {
    return {
      list: {},
      page: 1,
      total: 0,
      filter: undefined,
      multipleSelection: [],
      dialogVisible: false,
      loading: false
    };
  },
  filters: {
    statusFilter(status) {
      // const statusMap = {
      //   true:"success",
      //   false:"danger"
      // };
      // return statusMap[status];
      return status ? "success" : "danger";
    },
    genderFilter(gender) {}
  },
  methods: {
    sortChange() {},
    handleChange() {
      this.loading = true;
      this.getList(this.page);
    },
    genderFormat(row, column, cellValue, index) {
      let gender = row.gender;
      if (gender === null) {
        return "未知";
      } else {
        return gender === 1 ? "男" : "女";
      }
    },
    getList(id) {
      getUsers(id).then(response => {
        console.log("---------");
        const { data } = response;
        this.total = data.count;
        this.list = data.results;
        this.loading = false;
      });
    }
  },
  mounted() {
    this.getList(1);
  },
  components: {
    eHeader: eHeader,
    edit: edit,
    updatePass: updatePass
  }
};
</script>
<style lang="scss" scoped>
</style>
