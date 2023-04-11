import { Ref, unref, watch, ref, nextTick } from 'vue';
type EventFun = (e: Event) => {};
export function UseaddEventListener(
  el = window,
  EventType: string,
  fn: Function,
  useCapture: boolean = true,
) {
  const element = ref<Element | undefined>(el);
  // 获取dom实例
  const getdom = () => {
    const elRef = unref(el);
    if (!elRef || !unref(elRef)) {
      return;
    }
    element.value = elRef;
  };
  nextTick(() => {
    if (!element || !unref(element)) {
      getdom();
    }
    // ;
    const elm = unref(element);
    addhandle(elm);
  });

  const addhandle = (e: Element) => {
    setTimeout(() => {
      e = e ?? unref(element);
      if (e.addEventListener) {
        e.addEventListener(EventType, fn, useCapture);
      }
    }, 1);
  };
  // 清除事件
  const removeEvent = (e) => {
    e = e ?? element.value;
    if (e.removeEventListener) {
      e.removeEventListener(EventType, fn, useCapture);
    } else if (e.detachEvent) {
      e.detachEvent(EventType, fn, useCapture);
    }
  };
  const remove = () => {
    removeEvent(unref(element) ?? el);
  };
  return {
    removeFun: remove,
  };
}
