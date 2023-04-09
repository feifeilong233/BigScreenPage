<script lang="tsx">
import {
  defineComponent,
  PropType,
  computed,
  unref,
  ref,
  onMounted,
} from 'vue';
import { useResizeSize } from '@/hooks/useResizeSize';

export default defineComponent({
  name: 'ScreenWarp',
  setup(_, { slots }) {
    //   直接拿props是不行需要借助computed来props的值
    let doms = ref(null as HTMLDivElement | null);
    useResizeSize(doms);
    return () => (
      <>
        <div class='ScreenAdapter' ref={doms}>
          {slots.default ? slots.default() : slots.default}
        </div>
      </>
    );
  },
});
</script>
<style lang="less" scoped>
.ScreenAdapter {
  transform-origin: 0 0;
  position: absolute;
  left: 50%;
  top: 50%;
  transition: 0.3s;
}
</style>
