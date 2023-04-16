<template>
  <a-modal
      :title=title
      :width="640"
      :visible="visible"
      :confirmLoading="loading"
      @ok="() => { $emit('ok') }"
      @cancel="() => { $emit('cancel') }"
  >
    <a-spin :spinning="loading">
      <a-form v-bind="formLayout">
        <!-- 检查是否有 id 并且大于0，大于0是修改。其他是新增，新增不显示主键ID -->
        <a-form-item v-bind="validateInfos.parent_name" label="父级名称">
          <a-input disabled v-model:value="formRef.parent_name" placeholder="父级名称"/>
        </a-form-item>
        <a-form-item v-bind="validateInfos.short_name" label="路面索引">
          <a-input v-model:value="formRef.short_name" placeholder="路面索引"/>
        </a-form-item>
        <a-form-item v-bind="validateInfos.name" label="路面名称">
          <a-input v-model:value="formRef.name" placeholder="路面名称"/>
        </a-form-item>
        <a-form-item v-if="isRoot" v-bind="validateInfos.code" label="路面材料">
          <a-select v-model:value="formRef.code" placeholder="请选择路面材料">
            <a-select-option v-for="(item, index) in code_data" :key="index" :value="item.code"> {{ item.name }}
            </a-select-option>
          </a-select>
        </a-form-item>
        <a-form-item v-if="isRoot" v-bind="validateInfos.classify" label="弹性模量">
          <a-input-number v-model:value="formRef.classify" placeholder="弹性模量"/>
        </a-form-item>
        <a-form-item v-if="isRoot" v-bind="validateInfos.remark" label="泊松比">
          <a-input-number :step="0.01" v-model:value="formRef.remark" placeholder="泊松比"/>
        </a-form-item>
        <a-form-item v-if="isRoot" v-bind="validateInfos.order_by" label="厚度">
          <a-input-number :step="0.01" v-model:value="formRef.order_by" placeholder="厚度"/>
        </a-form-item>
      </a-form>
    </a-spin>
  </a-modal>
</template>

<script lang="ts">
// @ts-nocheck
import {defineComponent, reactive, onMounted, ref} from 'vue'
import {Form} from 'ant-design-vue'
import {findDictionaryList} from "@/api/system/dictionary";
import storage from "store";
import {ACCESS_TOKEN} from "@/store/mutation-types";

interface Fields {
  id?: string,
  name: string,
  short_name: string,
  code: string,
  classify: number,
  remark: number,
}

const useForm = Form.useForm;
export default defineComponent({
  props: {
    visible: {
      type: Boolean,
      required: true
    },
    loading: {
      type: Boolean,
      default: () => false
    },
    model: {
      type: Object,
      default: () => null
    }
  },
  components: {},
  setup(props) {
    const {model} = props
    const formLayout = {
      labelCol: {
        xs: {span: 24},
        sm: {span: 6}
      },
      wrapperCol: {
        xs: {span: 24},
        sm: {span: 14}
      }
    }

    const baseURL = <string>import.meta.env.VITE_APP_BASE_API;
    const code_data = ref([]);

    // 表单字段
    const formRef = reactive(<Fields>{
      id: "",
      name: "",
      short_name: "",
      code: undefined,
      classify: 0,
      remark: 0.00,
    });

    const title = ref("新增数据")

    // 自动请求并暴露内部方法
    onMounted(() => {
      formRef.parent_id = model?.parent_id;
      formRef.parent_name = model?.parent_name;
      if (model?.id != null && model?.id != undefined) {
        formRef.id = model?.id;
        formRef.name = model?.name;
        formRef.short_name = model?.short_name;
        formRef.code = model?.code;
        formRef.classify = model?.classify;
        formRef.remark = model?.remark;
        formRef.order_by = model?.order_by;
        title.value = "编辑数据";
      }
      initData();
    })

    const rulesRef = reactive({
      id: [{required: false}],
      name: [{required: false}],
      short_name: [{required: false}],
      code: [{required: false}],
      classify: [{required: false}],
      remark: [{required: false}],
      parent_id: [{required: false}],
      parent_name: [{required: false}],
      order_by: [{required: false}]
    })

    const isRoot = ref(true);

    const initData = () => {
      isRoot.value = true;
      findDictionaryList({parent_code: 'lmcl'}).then((response) => {
        code_data.value = response.data.data;
      })
      if (model?.parent_id == '1') {
        isRoot.value = false;
      }
    }
    const {validate, validateInfos} = useForm(formRef, rulesRef);

    const accessToken = storage.get(ACCESS_TOKEN);
    const headers = ref();
    headers.value = {
      Authorization: "bearer " + accessToken,
    };

    return {
      formLayout,
      formRef,
      validate,
      validateInfos,
      title,
      baseURL,
      headers,
      code_data,
      isRoot
    }
  }
})
</script>
