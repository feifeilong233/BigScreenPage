<!--
 * @Author: your name
 * @Date: 2021-12-29 22:26:38
 * @LastEditTime: 2021-12-29 23:00:55
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: \vuebig-screen\src\view\home.vue
-->
<template>
  <div class="w-full h-screen flex-col px-1 py-1">
    <div class="w-full h-10vh">
      <Vheader />
    </div>
    <div class="h-82vh">
      <Vcontent></Vcontent>
    </div>
  </div>
</template>
<script lang="ts" setup>
import { defineAsyncComponent } from 'vue';
import { RouterPush, RouterReplace } from '@/routers/basicRouter';
const Vheader = defineAsyncComponent(() => import('./components/header.vue'));
const Vcontent = defineAsyncComponent(
  () => import('./components/container.vue'),
);
</script>
