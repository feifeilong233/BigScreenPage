## 基于Web3D的沥青路面性能试验平台

#### 介绍
springboot2.6.x+vue3-antdesign-vite架构，实现了系统管理模块、权限控制模块（菜单权限、功能按钮权限、数据权限）、代码生成器（单表、树表）、quartz动态定时器等功能。

#### 软件架构
软件架构说明

- springboot2.6.x
- mybatis-plus
- mysql
- quartz
- vue3
- antdesign
- vite

#### feat
- KoTime后端性能分析
- socket长连接实时监控


- worker&OffscreenCanvas渲染优化
- 集成开源项目Paravie Glance

#### todo
- 首页echarts滚动更新
- 首页echarts补完
- 内置Paraview
- 论文换图
- 仿真分析界面 steps
- 多语言支持


- 路面管理页面表格区分
- 预览路面页面鼠标交互

- 序列图p45
- 降重
- 国内外研究现状

```
├── public # 项目静态资源目录
├── src
│   ├── api                  # Api ajax 等
│   ├── assets               # 本地静态资源
│   ├── components           # 业务通用组件
│   ├── config               # 项目基础配置，包含路由，全局设置
│   ├── core                 # 项目引导, 全局配置初始化，依赖包引入等
│   ├── hooks                # 项目钩子
│   ├── layouts              # 框架布局文件
│   ├── lib                  # 项目前置库
│   ├── locales              # 国际化资源
│   ├── router               # Vue-Router
│   ├── store                # Vuex
│   ├── style                # 全局样式
│   ├── utils                # 工具库
│   ├── views                # 业务页面入口和常用模板
│      ├── account           # 账户模块
│      ├── common            # 通用模块
│      ├── dashboard         # 首页
│      ├── dtChart           # Echarts仪表盘
│      ├── example           # 案例模块
│      ├── exception         # 异常模块
│      ├── quatz             # 定时模块
│      ├── simulation        # 路面仿真模块
│      ├── system            # 系统模块
│      ├── user              # 用户管理模块
│   ├── App.vue              # Vue 模板入口
│   └── main.js              # Vue 入口 JS
│   └── permission.js        # 路由守卫(路由权限控制)
└── package.json
```
