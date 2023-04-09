<template>
  <div class="min-h-screen w-full">
    <div class="text-center text-gray-800 font-bold my-4">VBORDER.1</div>
    <ul class="flex flex-col w-full">
      <li
        v-for="item in paths"
        :key="item.name"
        class="my-1 text-center text-purple-200 cursor-pointer"
      >
        <RouterLink :path-list="item" />
      </li>
    </ul>
  </div>
</template>

<script setup>
import { defineAsyncComponent, ref } from 'vue';
import { getHistoryRouter } from '@/routers/basicRouter.ts';
const paths = ref();
getHistoryRouter().then((res) => {
  paths.value = [...res].slice(0, res.length - 2); // 这里按需求截取
});
const RouterLink = defineAsyncComponent(() => import('@/components/link.vue'));
</script>
