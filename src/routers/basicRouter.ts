import {
  RouteRecordRaw,
  createRouter,
  createWebHashHistory,
  RouterOptions,
  START_LOCATION,
  RouteRecord,
  RouteLocationRaw,
  NavigationFailure,
} from 'vue-router';
import { RouterRaws } from './types';
import { defineAsyncComponent } from 'vue';
interface RouterOtherOptions {
  linkActiveClass?: string;
  scrollBehavior?: () => { top: number };
}
const LAYOUT = defineAsyncComponent(() => import('@/layout/index.vue'));
const publicPath: any = import.meta.env.VITE_PUBLIC_PATH;
const basicRouter: RouterRaws[] = [
  {
    name: 'Root',
    meta: { title: 'root', transition: 'sade' },
    component: LAYOUT,
    redirect: '/home',
    path: '/',
    children: [
      {
        name: 'home',
        meta: { title: '主页面' },
        component: () => import('@/view/home.vue'),
        path: 'home',
      },
      {
        name: 'datax',
        meta: { title: '其他页面' },
        component: () => import('@/view/datax.vue'),
        // alias:'alias', // 路由别名
        path: 'datax',
        beforeEnter: function () {
          //  独享守卫
        },
      },
    ],
  },
  {
    name: 'd3maps',
    meta: { title: '自定义大屏' },
    component: () => import('@/view/d3maps/dome/dome1.vue'),
    path: '/d3maps',
  },
 
];
/**
 *
 * @returns
 * scrollBehavior:使用前端路由，当切换到新路由时，想要页面滚到顶部，或者是保持原先的滚动位置，就像重新加载页面那样。 vue-router 能做到，而且更好，它让你可以自定义路由切换时页面如何滚动
 */
function RouterOtherOption(): RouterOtherOptions {
  return {
    linkActiveClass: 'isClick',
    scrollBehavior: function () {
      // 始终滚动到顶部
      return { top: 0 };
    },
  };
}

export const router = createRouter({
  // 如果想要支出SEO那需要配置createWebHashHistory参数
  history: createWebHashHistory(publicPath as string),
  routes: basicRouter as unknown as RouteRecordRaw[],
  ...RouterOtherOption(),
} as RouterOptions);

/**
 * 路由守卫
 */
router.beforeEach((_, from) => {
  if (from === START_LOCATION) {
    // 首页提示
    //     alert('/')
  }
});
/**
 * 路由回退
 */
export function HistoryCallBackRouter() {
  router.go(-1);
}
/**
 *
 * @returns 获取所有 路由记录的完整列表,并不是路由历史而是 所有注册成功的路由
 */
export function getHistoryRouter(): Promise<RouteRecord[]> {
  return new Promise((resolve) => {
    resolve(router.getRoutes() as RouteRecord[]);
  });
}
/**
 *
 * @param path 路由地址，是否存在指定名称的路由，输入name的值，而不是path
 * @returns
 */
export function hasHistoryRouter(path: string | symbol): Boolean {
  const ishas = router.hasRoute(path) as Boolean;
  return ishas;
}
/**
 *
 * @param to 路由名称，编程导航
 * @returns
 */
export function RouterPush(
  to: RouteLocationRaw,
): Promise<NavigationFailure | void | undefined> {
  return router.push(to);
}
/**
 *
 * @param to 路由名称
 * @returns
 * 路由替换 类似于push
 * 相同点：都可以做路由跳转
 * 不同点：跳转之后不能使用go回退
 *
 */
export function RouterReplace(
  to: RouteLocationRaw,
): Promise<NavigationFailure | void | undefined> {
  return router.replace(to);
}
/**
 *
 * @param routes 路由数组，路由添加
 */

export function RoutertoAdd(routes: RouteRecordRaw[]): void {
  routes.forEach((element) => {
    router.addRoute(element);
  });
}
