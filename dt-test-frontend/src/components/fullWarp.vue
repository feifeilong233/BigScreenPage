<script lang="tsx">
import { defineComponent, PropType, computed } from 'vue';
const props = {
  enterClass: String as PropType<String>,
};

export default defineComponent({
  name: 'FullWarp',
  props,
  setup(props, { slots }) {
    //   直接拿props是不行需要借助computed来props的值
    let enterProps: any = computed(() => {
      return props.enterClass;
    });
    return () => (
      <>
        <div
          class={`${
            enterProps ? 'enter-y-r' : ''
          } my-4 w-full h-full   space-y-2  dark:bg-gray-800`}
        >
          {slots.default ? slots.default() : slots.default}
        </div>
      </>
    );
  },
});
</script>
