<template #footerRender>
  <global-footer
    class="footer custom-render"
    :links="[
          { title: 'Ant Design Vue', href: 'https://next.antdv.com' },
        ]"
    copyright="2023 &copy; Feilong Wen"
  />
</template>

<script lang="ts">
import {defineComponent} from 'vue';
import { GlobalFooter } from '@ant-design-vue/pro-layout'

export default defineComponent({
  name: 'ProGlobalFooter',
  components: {
    GlobalFooter
  }
})
</script>
