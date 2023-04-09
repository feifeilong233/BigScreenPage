<template>
  <div
    class="echartTemp"
    :style="{ background: title == 'false' ? 'transparent' : '' }"
  >
    <div v-if="title != 'false'" class="echartTemp_title">
      {{ title }}
    </div>
    <div :class="elementName" style="width: 100%; height: 100%"></div>
  </div>
</template>

<script lang="ts" setup>
import {
  defineProps,
  PropType,
  defineExpose,
  ref,
  withDefaults,
  unref,
} from 'vue';
import { useEcharts } from '@/hooks/useEchart';
interface propsType {
  elementName?: PropType<String>;
  stateData: any;
  title: String;
}
const props = withDefaults(defineProps<propsType>(), {
  elementName: String,
  title: String,
  stateData: {},
});
import { onMounted } from 'vue';
const datas = ref('aaa');

onMounted(() => {
  let { setOptions, myEchart } = useEcharts(
    document.querySelector(`.${props.elementName}`),
  );
  setOptions(unref(props.stateData));
  datas.value = myEchart;
});
// 更换数据 通过此功能实现动态更改数据
const updataEchart = (data) => {
  if (!data || data == {}) {
    throw console.error('data is empty');
  }
  unref(datas).value?.setOption(data ?? {});
};
// 传递给父级
defineExpose({
  datas,
  updataEchart,
});
</script>
<style lang="less" scoped>
.echartTemp {
  width: 100%;
  height: 100%;
  position: relative;
  background: #3e8ef61f;
  &_title {
    position: absolute;
    width: 100%;
    top: 0;
    left: 0.5rem;
    color: #d1effe;
    font-size: 0.9rem;
    padding-left: 0.5rem;
    background: linear-gradient(to right, #51b8a22c, transparent);
    text-align: start;
    padding-left: 1rem;
    &::before {
      content: '';
      display: inline-block;
      width: 3px;
      height: 120%;
      background: #008c8c;
      position: absolute;
      left: 0.2rem;
      top: -0.4rem;
      transform: rotate(45deg);
    }
    // border: 1px solid #9dd9f3;
    // border-image:linear-gradient(90deg,hsla(0,0%,100%,0),#9dd9f3,hsla(0,0%,100%,0)) 1;
  }
}
</style>
