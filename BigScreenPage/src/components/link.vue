<script lang="tsx">
import { defineComponent, PropType, computed } from 'vue';
const props = {
  pathList: Object as PropType<{}>,
};
export default defineComponent({
  name: 'Link',
  props,
  setup(props) {
    /**
     * custom :<router-link> 是否应该将其内容包裹在 <a> 元素中
     */
    let urls: any = computed(() => {
      return props.pathList;
    });
    const isActiveStyle =
      'border text-purple-200 list-item font-sans font-400 text-sm  py-2  flex-1 h-full border-purple-200';
    const isContomsStyle =
      'border list-item font-sans font-400 text-sm   py-2 text-gray-400 ';
    return () => {
      return (
        <>
          <router-link to={urls.value.path} custom={true}>
            {{
              default: ({ href, route, isActive }) => (
                <a
                  href={href}
                  class={isActive ? isActiveStyle : isContomsStyle}
                >
                  {route.meta.title}
                </a>
              ),
            }}
          </router-link>
        </>
      );
    };
  },
});
</script>
