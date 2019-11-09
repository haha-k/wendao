<template>
  <div class="block">
    <el-timeline>
      <el-timeline-item v-for="(item,index) of timeline" :key="index" :timestamp="item.timestamp" placement="top">
        <el-card>
          <h4>{{ item.title }}</h4>
          <p>{{ item.content }}</p>
        </el-card>
      </el-timeline-item>
    </el-timeline>
  </div>
</template>

<script>
export default {
  data() {
    return {
      timeline: [
        {
          timestamp: '2019/8/20',
          title: '添加了一个教练',
          content: 'haha52 提交于 2019/8/20 20:46'
        },
        {
          timestamp: '2019/8/21',
          title: '删除了一个视频',
          content: 'haha52 提交于 2019/8/21 20:46'
        },
        {
          timestamp: '2019/8/21',
          title: '删除了一个课程',
          content: 'haha52 提交于 2019/8/21 20:46'
        },
        {
          timestamp: '2019/8/21',
          title: '同意了一个大师申请',
          content: 'haha52 提交于 2019/8/21 20:46'
        },
        {
          timestamp: '2019/8/21',
          title: '添加了一个视频',
          content: 'haha52 提交于 2019/8/21 20:46'
        },
      ]
    }
  }
}
</script>
