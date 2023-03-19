import type { RouteRecordRaw } from 'vue-router';
import { RouteMeta } from 'vue-router';
import { defineComponent } from 'vue';
export type Component<T extends any = any> =
  | ReturnType<typeof defineComponent>
  | (() => Promise<typeof import('*.vue')>)
  | (() => Promise<T>);

// Omit会构造一个除类型K外具有T性质的类型 Omit<T,K>
export interface AppRouteRecordRaw {
  name: string;
  meta: RouteMeta;
  redirect?: string;
  component?: Component | string;
  components?: Component;
  children?: AppRouteRecordRaw[];
  path?: string;
}
export type RouterRaws = AppRouteRecordRaw & RouteRecordRaw;
