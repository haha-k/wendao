<template>
  <div class="app-container">
    <div class="header-container">
      <el-input
        v-model="filter"
        placeholder="输入关键字(图片id)搜索"
        clearable
        class="filter-item"
        @keyup.enter.native="handleFilter"
        style="width:200px;"
        size="small"
      ></el-input>
      <el-button
        type="primary"
        size="mini"
        @click="handleFilter"
        class="filter-item"
        style="margin-left:10px"
        icon="el-icon-search"
      >搜索</el-button>
      <el-button-group>
        <el-button-group>
          <el-button
            type="primary"
            size="mini"
            @click="newPic"
            style="margin-left:10px;"
            class="filter-item"
            icon="el-icon-edit"
          >新增</el-button>
          <el-button
            class="filter-item"
            size="mini"
            type="danger"
            icon="el-icon-delete"
            @click="dialogVisible = true"
          >删除</el-button>
        </el-button-group>
        <el-dialog title="提示" :visible.sync="dialogVisible" width="30%">
          <span>确定要删除选中的吗</span>
          <span slot="footer" class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="deleteSelect">确 定</el-button>
          </span>
        </el-dialog>
      </el-button-group>
      <el-button
        type="primary"
        size="mini"
        @click="handleDownload"
        class="filter-item"
        style="margin-left:10px;float:right;"
        icon="el-icon-download"
      >导出</el-button>
    </div>
    <upload-image ref="upload"></upload-image>
    <el-table
      v-loading="loading"
      ref="table"
      :data="pictures"
      size="small"
      border
      style="width: 100%;"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center"></el-table-column>
      <el-table-column sortable prop="picture_id" label="ID" width="60" align="center"></el-table-column>
      <el-table-column prop="url" label="链接" align="center" show-overflow-tooltip />
      <el-table-column align="center" prop="user" label="上传人" width="100px"></el-table-column>
      <el-table-column sortable prop="create_time" label="创建时间" align="center" width="180" />
      <el-table-column prop="update_date" label="更新时间" align="center" width="180" />
      <el-table-column align="center" label="缩略图" width="100px">
        <template slot-scope="scope">
          <img :src="scope.row.url" class="pic" />
        </template>
      </el-table-column>
      <el-table-column label="操作" width="300px" align="center">
        <template slot-scope="scope">
          <el-button-group>
            <el-button type="primary" @click="handleLook(scope.row.picture_id)">查看</el-button>
            <el-button type="success" @click="handleEdit(scope.row.picture_id)">更新</el-button>
            <el-button type="danger" @click="subDelete(scope.row.picture_id)">删除</el-button>
          </el-button-group>
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
import uploadImage from "@admin/components/global/UploadImage";
import {
  getPics,
  addPic,
  updatePic,
  deletePic,
  getPicDetail
} from "@/api/picture";
import { Message } from "element-ui";
import { flush } from "#/utils/common";

export default {
  name: "pictures",
  data() {
    return {
      pictures: {},
      total: 0,
      loading: false,
      page: 1,
      filter: undefined,
      multipleSelection: [],
      dialog: false,
      dialogVisible: false
    };
  },
  methods: {
    newPic() {
      const _this = this.$refs.upload;
      _this.dialog = true;
    },
    deleteSelect() {},
    handleDownload() {
      console.log("TODO 处理下载导出");
    },
    handleFilter() {
      console.log("TODO 搜索");
    },
    getList: function(page) {
      getPics(page).then(response => {
        const { data } = response;
        this.total = data.count;
        this.pictures = data.results;
        this.loading = false;
      });
    },
    handleChange() {
      this.loading = true;
      this.getList(this.page);
    },
    handleLook(id) {
      let url = this.pictures.find(element => element.picture_id == id).url;
      window.location.href = url;
    },
    subDelete(id) {
      deletePic(id)
        .then(result => {
          flush(this);
        })
        .catch(err => {
          Message.error(err);
        });
    },
    deleteSelect() {
      if (this.multipleSelection.length == 0) {
        this.dialogVisible = false;
        Message.error("您没有选择任何选项");
      } else {
        for (let selection of this.multipleSelection) {
          deletePic(selection.picture_id)
            .then(result => {
              this.dialogVisible = false;
              flush(this);
            })
            .catch(err => {
              Message.error(err);
            });
        }
      }
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    }
  },
  mounted() {
    this.getList(1);
  },
  components: {
    uploadImage: uploadImage
  }
};
</script>
<style lang="scss" scoped>
.pictures {
}
</style>
