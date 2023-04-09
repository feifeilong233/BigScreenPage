<template>
  <div class="echartsdoms flex flex-col px-5">
    <div class="echartsdoms_header flex justify-center w-full h-5vh">
      <div class="bigtitle w-full">
        <div class="xline"></div>
        <div class="titlbox">
          <div class="border1"></div>
          <div class="border1"></div>
          <div class="border1"></div>
          <div>可视化大屏模板</div>
          <div></div>
        </div>
      </div>
    </div>
    <div class="echartsdoms_cons w-full flex justify-between">
      <div class="chartsdoms_cons_lefts space-y-2 w-22vw">
        <div class="box1 enter-x-l w-22vw">
          <div class="title1">测试指数</div>
          <div class="h-20vh flex items-center">
            <div class="w-1/2 h-full">
              <EchartTemp
                elementName="enter3"
                :stateData="WaterOptions"
                title="false"
              ></EchartTemp>
            </div>
            <div class="titltest">
              <div>使用数量</div>
              <div>912345</div>
              <div>
                目前已经运行
                <a class="text-blue-300">82</a>
                天
              </div>
            </div>
          </div>
        </div>
        <div class="box2 enter-x-l w-full h-20vh grid grid-cols-2 gap-2">
          <div class="flex justify-center items-center">
            <div class="bords w-1/3">
              <div>
                <EchartTemp
                  elementName="pie1"
                  :stateData="pieOpsionts('#fb7185', '#fda4af', 20)"
                  title="false"
                ></EchartTemp>
              </div>
            </div>
            <div class="dtext flex flex-col justify-center space-y-1">
              <span class="txt1">
                总数：
                <a>90%</a>
              </span>
              <span class="txt1">增长：1</span>
            </div>
          </div>
          <div class="flex justify-center items-center">
            <div class="bords w-1/3">
              <div>
                <EchartTemp
                  elementName="pie2"
                  :stateData="pieOpsionts('#fed7aa', '#fdba74', 40)"
                  title="false"
                ></EchartTemp>
              </div>
            </div>
            <div class="dtext flex flex-col justify-center space-y-1">
              <span class="txt1">
                总数：
                <a>90%</a>
              </span>
              <span class="txt1">增长：1</span>
            </div>
          </div>
          <div class="flex justify-center items-center">
            <div class="bords w-1/3">
              <div>
                <EchartTemp
                  elementName="pie3"
                  :stateData="pieOpsionts('#a7f3d0', '#6ee7b7', 20)"
                  title="false"
                ></EchartTemp>
              </div>
            </div>
            <div class="dtext flex flex-col justify-center space-y-1">
              <span class="txt1">
                总数：
                <a>90%</a>
              </span>
              <span class="txt1">增长：1</span>
            </div>
          </div>
          <div class="flex justify-center items-center">
            <div class="bords w-1/3">
              <div>
                <EchartTemp
                  elementName="pie4"
                  :stateData="pieOpsionts('#bae6fd', '#7dd3fc', 20)"
                  title="false"
                ></EchartTemp>
              </div>
            </div>
            <div class="dtext flex flex-col justify-center space-y-1">
              <span class="txt1">
                总数：
                <a>90%</a>
              </span>
              <span class="txt1">增长：1</span>
            </div>
          </div>
        </div>
        <div class="box3 enter-x-l h-45vh">
          <div class="title1">测试指数</div>
          <div class="h-40vh">
            <EchartTemp
              elementName="enter4"
              :stateData="baroption"
              title="false"
            ></EchartTemp>
          </div>
        </div>
      </div>
      <div class="chartsdoms_cons_rights space-y-2 w-22vw">
        <div class="box1 enter-x-r w-22vw">
          <div class="title1">测试指数</div>
          <div class="h-25vh">
            <EchartTemp
              elementName="CriOption"
              :stateData="CriOption"
              title="false"
            ></EchartTemp>
          </div>
        </div>
        <div class="box1 enter-x-r w-22vw">
          <div class="title1">测试指数</div>
          <div class="h-30vh">
            <EchartTemp
              elementName="lineOptions"
              :stateData="lineOptions"
              title="false"
            ></EchartTemp>
          </div>
        </div>
        <div class="box1 enter-x-r w-22vw">
          <div class="title1">测试指数</div>
          <div class="h-20vh">
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
import { defineAsyncComponent, ref } from 'vue';
import {
  baroption,
  pieOpsionts,
  CriOption,
  lineOptions,
  ApOption,
  WaterOptions,
} from './datas';
const EchartTemp = defineAsyncComponent(
  () => import('@/components/echartTemp.vue'),
);
let option = ref();
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
.titltest {
  & > div:nth-of-type(1) {
    color: #c9dcf5;
    font-size: 1rem;
  }
  & > div:nth-of-type(2) {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    font-weight: bold;
    font-size: 1.3rem;
    color: rgba(251, 191, 36, 1);
    & ~ div {
      color: #c9dcf5;
      font-size: 0.8rem;
    }
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
    .chartsdoms_cons_lefts {
      .box1 {
        .maobg;
      }
      .box2 {
        & > div {
          .maobg;
          .bords {
            & > div {
              width: 3rem;
              height: 3rem;
              text-align: center;
              color: #23b7cb;
              font-size: 0.8rem;
            }
          }
          .dtext {
            font-size: 0.5rem;
            margin-left: 0.5rem;
            a {
              color: #c9dcf5;
            }
          }
        }
      }
      .box3 {
        .maobg;
      }
    }
    .chartsdoms_cons_rights {
      .box1 {
        .maobg;
      }
    }
  }
}
</style>
