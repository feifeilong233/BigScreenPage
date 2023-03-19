/*
 * @Author: your name
 * @Date: 2021-09-03 15:31:21
 * @LastEditTime: 2021-09-03 15:32:27
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \datadome\src\ntils\libs.ts
 */
import * as echarts from 'echarts/core';
// echart 按需引入
import {
  BarChart,
  LineChart,
  PieChart,
  MapChart,
  PictorialBarChart,
  RadarChart,
  ScatterChart,
  GaugeChart,
} from 'echarts/charts';

import {
  TitleComponent,
  TooltipComponent,
  GridComponent,
  PolarComponent,
  AriaComponent,
  ParallelComponent,
  LegendComponent,
  RadarComponent,
  ToolboxComponent,
  DataZoomComponent,
  VisualMapComponent,
  TimelineComponent,
  CalendarComponent,
  GraphicComponent,
} from 'echarts/components';

import { SVGRenderer } from 'echarts/renderers';

echarts.use([
  LegendComponent,
  TitleComponent,
  TooltipComponent,
  GridComponent,
  PolarComponent,
  AriaComponent,
  ParallelComponent,
  BarChart,
  LineChart,
  GaugeChart,
  PieChart,
  MapChart,
  RadarChart,
  SVGRenderer,
  ScatterChart,
  PictorialBarChart,
  RadarComponent,
  ToolboxComponent,
  DataZoomComponent,
  VisualMapComponent,
  TimelineComponent,
  CalendarComponent,
  GraphicComponent,
]);

export default echarts;
