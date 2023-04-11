<template>
  <div class="echartsdoms flex flex-col px-5">
    <div class="echartsdoms_header flex justify-center w-full h-5vh">
      <div class="bigtitle w-full">
        <div class="xline"></div>
        <div class="titlbox">
          <div class="border1"></div>
          <div class="border1"></div>
          <div class="border1"></div>
          <div>沥青路面数字孪生试验平台</div>
          <div></div>
        </div>
      </div>
    </div>
    <div class="echartsdoms_cons w-full flex justify-between">
      <div id="three-frame"></div>
      <div class="chartsdoms_cons_rights space-y-2 w-22vw">
        <div class="box1 enter-x-r w-22vw">
          <div class="title1">测试指数</div>
          <div class="h-40vh box-body">
            <a-row>
              <a-col :span="12">
                <a-slider @change="onChange" v-model:value="inputValue" :min="0" :max="1" :step="0.01" />
              </a-col>
              <a-col :span="4">
                <a-input-number
                    id="text1"
                    v-model:value="inputValue"
                    :min="0"
                    :max="1"
                    :step="0.01"
                    style="margin-left: 16px"
                />
              </a-col>
            </a-row>
          </div>
        </div>
        <div class="box1 enter-x-r w-22vw">
          <div class="title1">测试指数</div>
          <div class="h-40vh">
            <EchartTemp
              elementName="ApOption"
              :stateData="ApOption"
              title="false"
            ></EchartTemp>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import 'virtual:windi.css';
import { defineAsyncComponent, ref } from 'vue';
import {onMounted} from '@vue/runtime-core';
import {
  baroption,
  pieOpsionts,
  CriOption,
  lineOptions,
  ApOption,
  WaterOptions,
} from './datas';
import {useRouter} from "vue-router";
import Render3DMode from './uselib/useThree2';
let {onChange} = Render3DMode('three-frame');

onMounted(() => {
  Render3DMode('three-frame');
});
const router = useRouter();
const EchartTemp = defineAsyncComponent(
  () => import('@/components/echartTemp.vue'),
);
const viewRoadDetail = () => {
  console.log('/')
  router.push({ path: '/chart/workplace' })
};
let option = ref();

const inputValue = ref<number>(0);

option.value = {
  grid: {
    top: '10%',
    bottom: '20%',
  },
  xAxis: {
    type: 'category',
    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
  },
  yAxis: {
    type: 'value',
  },
  series: [
    {
      data: [150, 230, 224, 218, 135, 147, 260],
      type: 'line',
    },
  ],
};
</script>

<style lang="less" scoped>
#three-frame {
  width: 100%;
  height: 100%;
  background: rgba(153, 150, 150, 0.738);
}
.xline {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 10px;

  background: linear-gradient(
    to right,
    transparent,
    rgba(251, 191, 36, 0.3),
    transparent,
    rgba(251, 191, 36, 0.3),
    transparent
  );
  transform: translateY(-100px);
  animation: doms 0.5s linear forwards;
  animation-delay: 0.7s;
}
.bigtitle {
  display: flex;
  justify-content: center;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 40px;
  .titlbox {
    width: 28rem;
    height: 100%;
    overflow: hidden;
    position: relative;
    & > div {
      position: absolute;
      width: 100%;
      top: 0;
      left: 0;
      //  background: red;
      &:nth-of-type(1) {
        width: 80%;
        left: 10%;
        border: 100px solid rgba(251, 191, 36, 0.3);
        border-left: 80px solid transparent;
        border-right: 80px solid transparent;
        transform: translateY(-100px);
        animation: doms 0.5s linear forwards;
        animation-delay: 0.2s;
        opacity: 0;
        z-index: 9;
      }
      &:nth-of-type(2) {
        width: 90%;
        left: 5%;
        border: 100px solid rgba(251, 191, 36, 0.2);
        border-left: 80px solid transparent;
        border-right: 80px solid transparent;
        transform: translateY(-100px);
        animation: doms 0.5s linear forwards;
        animation-delay: 0.3s;
        opacity: 0;
      }
      &:nth-of-type(3) {
        width: 100%;
        border: 100px solid rgba(251, 191, 36, 0.1);
        border-left: 140px solid transparent;
        border-right: 140px solid transparent;
        transform: translateY(-100px);
        animation: doms 0.5s linear forwards;
        animation-delay: 0.4s;
        opacity: 0;
      }
      &:nth-of-type(4) {
        width: 100%;
        text-align: center;
        font-weight: 600;
        color: #c9dcf5;
        font-size: 1.2rem;
        z-index: 10;
        transform: translateY(100px);
        padding-top: 0.2rem;
        animation: doms 0.5s linear forwards;
        font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande',
          'Lucida Sans', Arial, sans-serif;
      }
      &:nth-of-type(5) {
        width: 80%;
        left: 10%;
        height: 10px;
        top: 38px;
        background: linear-gradient(
          to right,
          transparent,
          rgba(115, 208, 245, 0.7),
          transparent
        );
        z-index: 9;
      }
    }
  }
}
@keyframes doms {
  to {
    transform: translateY(0);
    opacity: 1;
  }
}
.echartsdoms {
  width: 100%;
  height: 100%;
  .maobg {
    background: rgba(193, 189, 189, 0.1);
    backdrop-filter: blur(4px);
  }
  .title1 {
    color: #c9dcf5;
    border-bottom: 2px solid #525c66;
    padding: 0.3rem 0.5rem;
    position: relative;
    font-size: 0.8rem;
    font-weight: bold;
    &::before {
      content: '';
      display: inline-block;
      background: rgba(251, 191, 36, 1);
      width: 3px;
      height: 100%;
      position: absolute;
      left: 0;
      top: 0;
    }
  }
  &_cons {
    .txt1 {
      color: #c9dcf5;
      font-size: 8px;
    }
    .chartsdoms_cons_rights {
      .box1 {
        .maobg;
        .box-body {
          padding: 24px;
        }
      }
    }
  }
}
</style>
