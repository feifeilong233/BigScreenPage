<template>
  <page-header-wrapper>
    <a-card :bordered="false">
      <a-form class="center-form" @submit.prevent="handleSubmit">
        <a-space :size="24" style="margin-bottom: 12px">
          <a-form-item label="路面名称">
            <a-input v-model:value="formRef.road_name" placeholder="路面名称" />
          </a-form-item>
          <a-form-item label="路面索引">
            <a-input v-model:value="formRef.short_name" placeholder="路面索引" />
          </a-form-item>
          <a-form-item label="路面层数">
            <a-input-number v-model:value="formRef.road_num" placeholder="路面层数" />
          </a-form-item>
          <a-form-item>
            <a-button type="primary" ghost @click="handleAddLayers"><template #icon><highlight-outlined /></template>快速构建</a-button>
          </a-form-item>
        </a-space>

        <a-space
            :size="12"
            v-for="(item, index) in formRef.road_detail"
            :key="index"
            align="baseline"
        >
          <a-form-item label="层次名称">
            <a-input v-model:value="item.name" placeholder="请输入层次名称"/>
          </a-form-item>
          <a-form-item label="路面材料">
            <a-select style="width: 150px" v-model:value="item.code" placeholder="请选择路面材料">
              <a-select-option v-for="(item, index) in code_data" :key="index" :value="item.code">{{ item.name }}</a-select-option>
            </a-select>
          </a-form-item>
          <a-form-item label="弹性模量">
            <a-input-number v-model:value="item.classify" placeholder="请输入弹性模量" />
          </a-form-item>
          <a-form-item label="泊松比">
            <a-input-number :step="0.01" v-model:value="item.remark" placeholder="请输入泊松比" />
          </a-form-item>
          <MinusCircleOutlined @click="removeItem(item)" />
        </a-space>
        <a-form-item>
          <a-button type="dashed" style="width: 840px" @click="addItem">
            <PlusOutlined />
            新增层次
          </a-button>
        </a-form-item>
        <a-form-item>
          <a-button type="primary" html-type="submit">提交表单</a-button>
        </a-form-item>
      </a-form>
    </a-card>
  </page-header-wrapper>
</template>

<script lang="ts" setup>
import {onMounted, reactive, ref} from 'vue';
import {findDictionaryList} from "@/api/system/dictionary";
const code_data = ref([]);

interface RoadDetail {
  name?: string;
  classify?: number;
  code?: string;
  remark?: number;
  short_name?: number;
}

interface FormFields {
  road_name?: string;
  road_num?: number;
  short_name?: string;
  road_detail: RoadDetail[];
}

const formRef = reactive<FormFields>({
  road_name: '',
  road_num: undefined,
  short_name: '',
  road_detail: [],
});

onMounted(() => {
  initData();
})

const initData = () => {
  findDictionaryList({parent_code: 'lmcl'}).then((response) => {
    code_data.value = response.data.data;
  })
}

const removeItem = (item: RoadDetail) => {
  let index = formRef.road_detail.indexOf(item);
  if (index !== -1) {
    formRef.road_detail.splice(index, 1);
  }
  formRef.road_num = formRef.road_detail.length;
};
const addItem = () => {
  formRef.road_detail.push({
    name: undefined,
    classify: undefined,
    remark: undefined,
    code: undefined,
    short_name: undefined
  });
  formRef.road_num = formRef.road_detail.length;
};

const handleSubmit = () => {
  formRef.road_detail = formRef.road_detail.map((detail, i) => ({...detail, short_name: i+1}));
  console.log(formRef)
};

const handleAddLayers = () => {
  const numLayers = formRef.road_num || 0; // 获取层数，如果为空则默认为 0
  const currentNumLayers = formRef.road_detail.length;
  const numToAdd = numLayers - currentNumLayers; // 计算需要添加的层数
  if (numToAdd > 0) { // 需要添加层数
    const newLayers = Array.from({ length: numToAdd }, () => ({ // 使用 Array.from() 生成新层次信息
      name: undefined,
      classify: undefined,
      remark: undefined,
      code: undefined,
      short_name: undefined,
    }));
    formRef.road_detail.push(...newLayers); // 将新层次信息插入到 road_detail 数组中
  } else if (numToAdd < 0) { // 需要删除层数
    formRef.road_detail.splice(numLayers); // 删除超出的层次信息
  }
};

</script>

<style lang="less" scoped>
.center-form {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
</style>
