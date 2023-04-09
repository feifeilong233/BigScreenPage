import type { App, Directive, DirectiveBinding } from 'vue';
import store from '@/store'


const authDirective: Directive = {
  mounted (el, binding) {
      //功能权限获取，如：user:add
      const roles = store.getters.roles
      const permissionButtonList = roles.permissionButtonList
      //数据权限的组织集合
      const authOrganize = roles.authOrganize;
      //指令值
      const record = binding.arg;
      const actionName = record.auth;
  
      //367bc284f13c4316922c494d9bb1fab9,04a4542c3d5646fbb8b8038d4baa0dff
      let authOrgIds = authOrganize.authOrgIds;
      //e2fb8ce91fe6427f9fca22f8868095ea:Y,cab9013c4e984f079ed697cbfc86242f:N
      let authParams = authOrganize.authParams;
      //获取用户id
      let user_id = authOrganize.user_id;
      var createParams = record.create_organize + ":Y";
  
      let bol = false;
      if (permissionButtonList.includes(actionName)) {
        if (authOrgIds == "" || authOrgIds == undefined) {
          if (user_id == record.create_user) {
            bol = true;
          }
        } else {
          if (
            authParams.indexOf(createParams) > -1 ||
            user_id == record.create_user
          ) {
            bol = true;
          }
        }
      }
      if (!bol) {
        el.parentNode && el.parentNode.removeChild(el) || (el.style.display = 'none')
      }
    },
};

/**
 * Action 权限指令 - 数据权限
 * 指令用法：
 *  - 在需要控制 action 级别权限的组件上使用 v-action:[method] , 如下：
 *    <a-button v-action:add >添加用户</a-button>
 *    <a-button v-action:delete>删除用户</a-button>
 *    <a v-action:edit @click="edit(record)">修改</a>
 *
 *  - 当前用户没有权限时，组件上使用了该指令则会被隐藏
 *  - 当后台权限跟 提供的模式不同时，只需要针对这里的权限过滤进行修改即可
 */
export function setupActionDAuthDirective(app: App) {
  app.directive('action-dauth', authDirective);
}
export default authDirective;
