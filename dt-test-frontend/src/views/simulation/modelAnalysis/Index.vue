<template>
  <page-header-wrapper>
    <a-card :bordered="false">
      <a-steps :percent="percent" :current="current">
        <a-step title="开始" description="提交作业"/>
        <a-step title="启动Abaqus" description="运行有限元分析"/>
        <a-step title="解析结果" description="解析有限元仿真结果"/>
        <a-step title="完成" description="查看有限元仿真模型"/>
      </a-steps>
    </a-card>
    <a-card :bordered="false" style="margin-top: 14px">
      <a-row :gutter="14">
        <a-col :span="12">
          <div>路面基本信息核对</div>
          <a-table
              :columns="columns"
              :row-key="(record) => record.id"
              size="middle"
              :pagination="false"
              :data-source="dataSource"
              :loading="loading"
          >
            <template #bodyCell="{ column, text, record }">
              <span v-if="column.dataIndex === 'code'">{{ getCode(record.code) }}</span>
            </template>
          </a-table>
        </a-col>
        <a-col :span="4">
          <a-form @submit.prevent="handleSubmit">
            <a-form-item>
              <a-checkbox :checked="true">路面荷载模式</a-checkbox>
            </a-form-item>
            <a-form-item label="大小h(Pa)">
              <a-input :disabled="canEdit"></a-input>
            </a-form-item>
            <a-form-item label="宽度w(m)">
              <a-input :disabled="canEdit"></a-input>
            </a-form-item>
            <a-form-item>
              <a-checkbox :disabled="canEdit" v-model:checked="isShow">裂缝验算</a-checkbox>
            </a-form-item>
            <a-form-item v-if="isShow" label="设计温度T(℃)">
              <a-input :disabled="canEdit"></a-input>
            </a-form-item>
            <a-form-item>
              <a-space>
                <a-button type="primary" html-type="submit" :loading="canEdit">提交作业</a-button>
                <a-button type="primary" :disabled="current !== 3" ghost>查看结果</a-button>
              </a-space>
            </a-form-item>
          </a-form>
        </a-col>
      </a-row>
    </a-card>
  </page-header-wrapper>
</template>

<script lang="ts" setup>
import {computed, ref} from "vue";
import {useRoute} from "vue-router";
import {getTdemoById} from "@/api/common/tdemo";
import {findDictionaryList} from "@/api/system/dictionary";
import {onMounted} from "@vue/runtime-core";

const dataSource = ref([]);
const code_data = ref([]);
const route = useRoute();
const isShow = ref(false);
const canEdit = ref(false);

const percent = ref(0);
const current = ref(0);

// 计算属性，根据record.code翻译出对应的code值
const getCode = computed(() => (code) => {
  const item = code_data.value.find((item) => item.code === code);
  return item ? item.name : code;
});

const handleSubmit = () => {
  canEdit.value = true;
  current.value = 1;
  const times = setInterval(() => {
    if (percent.value < 100) {
      percent.value += Math.random() * (current.value == 2 ? 10 : Math.random());
    } else {
      current.value += 1;
      percent.value = 0;
    }
    if(current.value > 2) {
      clearInterval(times);
      canEdit.value = false;
    }
  }, 100);
}

const columns = [
  {
    title: "#",
    dataIndex: "short_name",
    width: "40px",
  },
  {
    title: "层次名称",
    dataIndex: "name",
    ellipsis: true,
  },
  {
    title: "路面材料",
    dataIndex: "code",
    ellipsis: true,
    width: "170px",
  },
  {
    title: "弹性模量",
    dataIndex: "classify",
    ellipsis: true,
  },
  {
    title: "泊松比",
    dataIndex: "remark",
    ellipsis: true,
  },
  {
    title: "厚度",
    dataIndex: "order_by",
    ellipsis: true,
  }
];

onMounted(() => {
  initData();
})

const initData = () => {
  getTdemoById(route.query.id).then((response) => {
    dataSource.value = response.data.data;
  })
  findDictionaryList({parent_code: 'lmcl'}).then((response) => {
    code_data.value = response.data.data;
  })
}
</script>

<style lang="less" scoped>

</style>
