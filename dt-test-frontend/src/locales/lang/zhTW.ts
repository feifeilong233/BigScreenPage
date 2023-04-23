import antd from 'ant-design-vue/es/locale-provider/zh_TW'

import dayjs from 'dayjs';
import 'dayjs/locale/zh-tw';
import global from './zh-TW/global'

import menu from './zh-TW/menu'
import setting from './zh-TW/setting'
import user from './zh-TW/user'
import dashboard from './zh-TW/dashboard'
import form from './zh-TW/form'
import result from './zh-TW/result'
import account from './zh-TW/account'

dayjs.locale('zh-tw');

const components = {
  antLocale: antd
}

export default {
  message: '-',

  'layouts.usermenu.dialog.title': '信息',
  'layouts.usermenu.dialog.content': '您确定要注销吗？',
  'layouts.userLayout.title': '基于Web3D的沥青路面性能试验平台',
  ...components,
  ...global,
  ...menu,
  ...setting,
  ...user,
  ...dashboard,
  ...form,
  ...result,
  ...account
}
