import { ref, unref, watch } from 'vue';
import { useTimeouts } from './useTimeout';
/**
 *
 * @param fn 防抖
 * @param wait
 * @returns
 */
export function useDebounceFn(fn, wait = 80) {
  if (typeof fn !== 'function') {
    return;
  }
  let Timer: any = null; // 防抖节流必须借助 闭包
  const isReady = ref<Boolean>(false);
  const clearun = () => {
    Timer && clearTimeout(Timer?.timer);
  };
  return function () {
    const _this = this;
    const args = arguments;
    const startFun = function () {
      isReady.value = true;
    };
    watch(
      () => unref(isReady),
      () => {
        if (unref(isReady) && Timer) {
          fn.apply(_this, args);
          isReady.value = false;
          Timer = null;
          clearun();
        }
      },
    );
    if (Timer) {
      clearun();
    }
    Timer = useTimeouts(startFun, wait);
  };
}
