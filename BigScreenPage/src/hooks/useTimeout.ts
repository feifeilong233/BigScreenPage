import { watch, ref, unref } from 'vue';
/**
 *
 * @param fn 定时器
 * @param wait
 * @returns
 */
export function useTimeouts(fn, wait) {
  if (typeof fn !== 'function') {
    return;
  }
  const readyTime = ref<Boolean>(false);
  watch(
    () => unref(readyTime),
    () => {
      if (unref(readyTime)) {
        fn();
        stop();
        readyTime.value = false;
      }
    },
    { immediate: true },
  );
  let timer;
  const start = () => {
    timer = setTimeout(() => {
      readyTime.value = true;
    }, wait);
  };
  const stop = () => {
    timer && clearTimeout(timer);
  };
  start();
  return { stop, timer };
}
