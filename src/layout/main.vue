<template>
  <Pages />
</template>

<script setup>
import { defineAsyncComponent } from 'vue';
const Pages = defineAsyncComponent(() => import('@/components/pages.vue'));
</script>
