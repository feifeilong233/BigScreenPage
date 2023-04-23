<template>
  <page-header-wrapper>
    <a-card :bordered="false">
      <a-steps>
        <a-step title="开始" description="提交作业" />
        <a-step title="启动Abaqus" description="运行有限元分析" />
        <a-step title="解析结果" description="解析有限元仿真结果" />
        <a-step title="完成" description="查看有限元仿真模型" />
      </a-steps>
    </a-card>
  </page-header-wrapper>
</template>

<script lang="ts" setup>

</script>

<style lang="less" scoped>

</style>
