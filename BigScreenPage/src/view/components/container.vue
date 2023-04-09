<!--
 * @Author: your name
 * @Date: 2021-12-29 22:26:38
 * @LastEditTime: 2022-04-23 13:24:07
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \vuebig-screen\src\view\home.vue
-->
<template>
  <SreenWarp>
    <div class="flex w-full h-full space-x-4"> 
      <div
        class="flex-1 flex flex-col h-full justify-center items-center enter-y-r bg-white"
      >
        <button
          class="px-4 py-1 text-sm font-semibold border border-purple-200 hover:(text-white bg-purple-600 border-transparent) focus:(outline-none ring-2 ring-purple-600 ring-offset-2)"
          @click="RouterPush('/d3maps')"
        >
          Three.js🍁
        </button>
      </div>
    </div>
  </SreenWarp>
</template>
<script setup>
import { defineAsyncComponent } from 'vue';
import { RouterPush } from '@/routers/basicRouter';
const SreenWarp = defineAsyncComponent(() =>
  import('@/components/fullWarp.vue'),
);
const toUrl = (path) => {
  RouterPush(path);
};
</script>
