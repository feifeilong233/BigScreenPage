import { nextTick, reactive, Ref, unref } from 'vue';
import { useDebounceFn } from './useDebounceFn';
import { UseaddEventListener } from './useAddEventListener';
interface Stylecss {
  width: string;
  height: string;
}
/**
 *  使用scale 内部dom需要百分比宽高
 * @param elRef dom
 */
export function useResizeSize(elRef: Ref<HTMLDivElement>) {
  // 默认大屏大小
  const styles = reactive<Stylecss>({
    width: `${window.innerWidth}px`,
    height: `${window.innerHeight}px`,
  });
  nextTick(() => {
    function ScreenScale() {
      if (unref(elRef)) {
        const element = unref<Element | CSSStyleRule>(elRef);
        const w = window.innerWidth / parseInt(styles.width as string);
        const h = window.innerHeight / parseInt(styles.height as string);
        // 不用管高度与宽度的自适应只需要管理横纵向的缩放即可
        let transform = `scale(${w},${h}) translate(-50%, -50%)`;
        element.style = `width:${styles.width};height:${styles.height};transform:${transform}`;
      }
    }
    ScreenScale();
    UseaddEventListener(
      window,
      'resize',
      useDebounceFn(() => ScreenScale(), 100),
    );
  });
}
