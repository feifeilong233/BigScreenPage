/*
 * @Author: your name
 * @Date: 2021-09-03 15:24:22
 * @LastEditTime: 2021-09-07 11:38:05
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \datadome\src\ntils\echarts.ts
 */

import echarts from '../lib/echarts';
import { unref, computed, ref, nextTick } from 'vue';
import type { Ref } from 'vue';
import { EChartsOption } from 'echarts/types/dist/shared';
import { UseaddEventListener } from '@/hooks/useAddEventListener';
import { useDebounceFn } from './useDebounceFn';
export function useEcharts(
  elRef: Ref<HTMLDivElement>,
  theme: 'light' | 'dark',
) {
  let chartInstance: echarts.ECharts | null = null;
  let myEchart = ref();
  let t = theme;
  let resizeFn: Function = resize;
  let cacheOptions = ref({}) as Ref<EChartsOption>;
  const initEcharts = () => {
    const el = unref(elRef);
    if (!el || !unref(el)) {
      return;
    }
    chartInstance = echarts.init(el, t);
    myEchart.value = chartInstance;
  };

  // 设置参数
  const getOptions = computed(() => {
    if (t !== 'dark') {
      return cacheOptions.value;
    }
    return {
      background: 'transparent',
      ...cacheOptions.value,
    } as EChartsOption;
  });
  // 获取参数
  const setOptions = (options: EChartsOption, clear = true) => {
    cacheOptions.value = options;

    nextTick(() => {
      if (!chartInstance) {
        initEcharts();
      }
      clear && chartInstance?.clear();
      chartInstance?.setOption(unref(getOptions));
    });
  };
  // 响应式
  function resize() {
    chartInstance?.resize();
  }
  const resizeFns = useDebounceFn(resize, 800);
  UseaddEventListener(window, 'resize', resizeFns);

  return {
    setOptions,
    myEchart,
  };
}
