<template>
  <Supense>
    <template #default>
      <router-view v-slot="{ Component, route }">
        <transition :name="route.meta.transition || 'fade'" mode="out-in">
          <keep-alive>
            <component :is="Component" :key="route.name" />
          </keep-alive>
        </transition>
      </router-view>
    </template>
  </Supense>
</template>

<script>
export default {};
</script>

<style></style>
