import echarts from '@/lib/echarts';
import {onUnmounted, ref, unref} from 'vue';
import 'echarts-liquidfill/src/liquidFill.js';
import {queryRoadFlatnessByPname, queryRoadStructureByParentName} from "@/api/common/chart";

var lineData = [2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1, 2.1];
var lastYearData = {
    1: [20, 62, 34, 55, 65, 33],
};
var thisYearData = {
    1: [],
};

var timeLineData = [1];

let myDataSet = [];
let antiSkid = [];
let roadFlatness = []
await queryRoadFlatnessByPname('STR1').then((response) => {
    myDataSet = response.data.data.filter(obj => obj.type == 1).map((obj) => obj.name);
    roadFlatness = response.data.data.filter(obj => obj.type == 1);
    thisYearData[timeLineData[0]] = roadFlatness.slice(0,8);
    antiSkid = response.data.data.filter(obj => obj.type == 2).slice(-6);
})

let myData = myDataSet.slice(0, 8);
let myData1 = myDataSet.slice(-6);

let startIndex = 0;
export const roadAxle = ref(41442589);

function updateMyData() {
    roadAxle.value += 1
    const endIndex = Math.min(startIndex + 8, myDataSet.length);
    let result = myDataSet.slice(startIndex, endIndex);
    let resultData = roadFlatness.slice(startIndex, endIndex)
    while (result.length < 8) {
        result = result.concat(myDataSet.slice(0, 8 - result.length));
    }
    while (resultData.length < 8) {
        resultData = resultData.concat(roadFlatness.slice(0, 8 - resultData.length))
    }
    myData = result;
    thisYearData[timeLineData[0]] = resultData;
    startIndex = (startIndex + 1) % myDataSet.length;

    baroption.value.baseOption.yAxis[1].data = myData.map(function (value) {
        return {
            value: value,
            textStyle: {
                align: 'center',
                fontSize: 11,
            },
        };
    });
    baroption.value.baseOption.yAxis[2].data = myData;
    baroption.value.options[0].series[1].data = thisYearData[timeLineData[0]];
}

let times = setInterval(() => {
    updateMyData();
}, 4200);

onUnmounted(() => {
    clearInterval(times);
})

var background = '#0e2147'; //背景

export let baroption = ref({
    baseOption: {
        timeline: {
            show: false,
            top: 0,
            data: [],
        },
        grid: [
            {
                show: false,
                left: '5%',
                top: '5%',
                bottom: '3%',
                containLabel: true,
                width: '37%',
            },
            {
                show: false,
                left: '10%',
                top: '5%',
                bottom: '3%',
                width: '0%',
            },
            {
                show: false,
                top: '5%',
                left: '15%',
                bottom: '3%',
                containLabel: true,
            },
        ],
        xAxis: [
            {
                type: 'value',
                inverse: true,
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                position: 'top',
                axisLabel: {
                    show: false,
                },
                splitLine: {
                    show: false,
                },
            },
            {
                gridIndex: 1,
                show: true,
            },
            {
                gridIndex: 2,
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                position: 'top',
                axisLabel: {
                    show: false,
                },
                splitLine: {
                    show: false,
                },
            },
        ],
        yAxis: [
            {
                type: 'category',
                inverse: true,
                position: 'right',
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                axisLabel: {
                    show: false,
                },
                data: myData,
            },
            {
                gridIndex: 1,
                type: 'category',
                inverse: true,
                position: 'left',
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                axisLabel: {
                    show: true,
                    textStyle: {
                        color: '#ffb137',
                        fontSize: 20,
                    },
                },
                data: myData.map(function (value) {
                    return {
                        value: value,
                        textStyle: {
                            align: 'center',
                            fontSize: 11,
                        },
                    };
                }),
            },
            {
                gridIndex: 2,
                type: 'category',
                inverse: true,
                position: 'left',
                axisLine: {
                    show: false,
                },
                axisTick: {
                    show: false,
                },
                axisLabel: {
                    show: false,
                },
                data: myData,
            },
        ],
        series: [],
    },
    options: [
        {
            series: [
                {
                    type: 'pictorialBar',
                    xAxisIndex: 2,
                    yAxisIndex: 2,
                    symbol: 'rect',
                    itemStyle: {
                        normal: {
                            color: 'rgba(122,202,236,0.27)',
                        },
                    },
                    barWidth: 5,
                    symbolRepeat: true,
                    symbolSize: 10,
                    data: lineData,
                    barCategoryGap: 100,
                    label: {
                        normal: {
                            show: true,
                            formatter: (series) => {
                                return thisYearData[timeLineData[0]][series.dataIndex].value;
                            },
                            position: 'right',
                            textStyle: {
                                color: '#c9dcf5',
                                fontSize: 10,
                            },
                            offset: [0, 1],
                        },
                    },
                    z: -1,
                },
                {
                    name: '2018',
                    type: 'pictorialBar',
                    xAxisIndex: 2,
                    yAxisIndex: 2,
                    symbol: 'roundRect',
                    barWidth: 5,
                    itemStyle: {
                        normal: {
                            barBorderRadius: 5,
                            color: '#ffb137',
                            fontSize: 10,
                        },
                    },
                    symbolRepeat: true,
                    symbolSize: [3, 12],
                    data: thisYearData[timeLineData[0]],
                    animationEasing: 'elasticOut',
                    animationDelay: function (dataIndex, params) {
                        return params.index * 30 * 1.1 / 2;
                    },
                },
            ],
        },
    ],
});

export const pieOpsionts = (
    color = '#ffb137',
    color2 = '#ffb137',
    num = 10,
) => {
    return {
        grid: {
            left: '0',
            right: '0',
            top: '0',
            bottom: '0',
        },
        series: [
            {
                name: 'Access From',
                type: 'pie',
                radius: ['70%', '75%'],
                avoidLabelOverlap: false,
                label: {
                    show: false,
                    position: 'center',
                },
                labelLine: {
                    show: false,
                },
                data: [
                    {
                        value: 1048,
                        name: 'Search Engine',
                        itemStyle: {
                            color: color2,
                        },
                    },
                ],
            },
            {
                name: 'Access From',
                type: 'pie',
                radius: ['80%', '90%'],
                label: {
                    show: true,
                    position: 'center',
                    textStyle: {
                        color: '#c9dcf5',
                        fontSize: '12',
                        fontWeight: 'bold',
                    },
                },
                labelLine: {
                    show: false,
                },
                smooth: true,
                data: [
                    {
                        value: 100 - num,
                        name: `${100 - num}%`,
                        itemStyle: {
                            normal: {
                                color: color,
                                // 设置扇形的阴影
                                shadowBlur: 5,
                                shadowColor: color,
                                shadowOffsetX: -1,
                                shadowOffsetY: 1,
                            },
                        },
                    },
                    {
                        value: num,
                        name: 'Search Enginea',
                        itemStyle: {
                            color: 'transparent',
                        },
                    },
                ],
            },
        ],
    };
};

var trafficWay = [
    {
        name: '火车',
        value: 20,
    },
    {
        name: '飞机',
        value: 60,
    },
    {
        name: '客车',
        value: 30,
    },
    {
        name: '轮渡',
        value: 40,
    },
];

await queryRoadStructureByParentName('STR1').then((response) => {
    trafficWay = response.data.data;
})

var data = [];
var data1 = [];
var color = [
    '#ffb137',
    '#fb923c',
    '#f87171',
    '#c3e8f0',
    '#0869b2',
    '#0869b2',
    '#ff3000',
];
var color1 = [
    '#54b2c4',
    '#83a8fb',
    '#8e88d6',
    '#d23f87',
    '#ffa800',
    '#ff5b00',
    '#ff3000',
];
var color2 = [
    '#54b2c4',
    '#00FFE3',
    '#257fc3',
    '#c3e8f0',
    '#0869b2',
    '#0869b2',
    '#ff3000',
];
for (var i = 0; i < trafficWay.length; i++) {
    data1.push({
        value: trafficWay[i].value,
        name: trafficWay[i].name,
        itemStyle: {
            normal: {},
        },
    });
    data.push(
        {
            value: trafficWay[i].value,
            name: trafficWay[i].name,
            itemStyle: {
                normal: {
                    // shadowBlur: 5,
                    borderColor: 'rgb(7 127 164,1)',
                    shadowColor: color[i],
                },
            },
        },
        {
            value: 2,
            name: '',
            itemStyle: {
                normal: {
                    label: {
                        show: false,
                    },
                    labelLine: {
                        show: false,
                    },
                    color: 'rgba(0, 0, 0, 0)',

                    borderWidth: 2,
                },
            },
        },
    );
}

export const CriOption = {
    color: color1,

    tooltip: {
        show: false,
    },

    toolbox: {
        show: false,
    },
    series: [
        {
            name: 'Access From',
            type: 'pie',
            radius: ['10%', '50%'],
            avoidLabelOverlap: false,
            roseType: 'radius',
            label: {
                show: false,
                position: 'center',
            },
            labelLine: {
                show: false,
            },
            itemStyle: {
                borderRadius: 5
            },
            data: data1.reverse(),
        },
        {
            name: '',
            type: 'pie',
            clockWise: false,
            radius: ['55%', '63%'],
            hoverAnimation: false,
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        position: 'outside',
                        color: '#c9dcf5',
                        formatter: function (params) {
                            var percent = 0;
                            var total = 0;
                            for (var i = 0; i < trafficWay.length; i++) {
                                total += trafficWay[i].value;
                            }
                            percent = ((params.value / total) * 100).toFixed(0);
                            if (params.name !== '') {
                                return params.name + ':' + percent + '%';
                            } else {
                                return '';
                            }
                        },
                    },
                    labelLine: {
                        length: 15,
                        length2: 20,
                        show: true,
                        color: '#00ffff',
                    },
                },
            },
            data: data,
        },
    ],
};

export const lineOptions = {
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            lineStyle: {
                color: '#ffb137',
            },
        },
    },
    legend: {
        icon: 'rect',
        itemWidth: 14,
        itemHeight: 5,
        itemGap: 13,
        data: ['移动', '电信', '联通'],
        right: '4%',
        textStyle: {
            fontSize: 11,
            color: '#F1F1F3',
        },
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '5%',
        top: '3%',
        containLabel: true,
    },
    xAxis: {
        type: 'category',
        boundaryGap: false,

        axisTick: {
            show: false,
        },
        axisLine: {
            show: true,
            lineStyle: {
                color: '#6b7580',
            },
        },
        axisLabel: {
            show: true,
            margin: 10,
            textStyle: {
                fontSize: 10,
                color: '#c9dcf5',
            },
        },
        splitLine: {
            show: false,
            lineStyle: {
                color: '#c9dcf5',
            },
        },
        data: ['1月', '1月', '1月', '1月', '1月', '1月', '1月', '1月'],
    },
    yAxis: {
        type: 'value',
        axisTick: {
            show: false,
        },
        axisLine: {
            show: true,
            lineStyle: {
                color: '#6b7580',
            },
        },
        axisLabel: {
            show: true,
            margin: 10,
            textStyle: {
                fontSize: 10,
                color: '#c9dcf5',
            },
        },
        splitLine: {
            show: false,
            lineStyle: {
                color: '#c9dcf5',
            },
        },
    },
    series: [
        {
            name: '移动',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                },
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(
                        0,
                        0,
                        0,
                        1,
                        [
                            {
                                offset: 1,
                                color: '#f87171',
                            },
                            {
                                offset: 1,
                                color: 'rgba(20,132,159,0.1)',
                            },
                        ],
                        false,
                    ),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10,
                },
            },
            itemStyle: {
                normal: {
                    color: '#f87171',
                    borderColor: 'rgba(20,132,159,0.27)',
                    borderWidth: 12,
                },
            },
            data: [220, 182, 191, 134, 150, 120, 110, 125, 145, 122, 165, 122],
        },
        {
            name: '电信',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 10,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                },
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(
                        0,
                        0,
                        0,
                        1,
                        [
                            {
                                offset: 1,
                                color: '#ffb137',
                            },
                            {
                                offset: 1,
                                color: 'rgba(239, 113,70, 0.1)',
                            },
                        ],
                        false,
                    ),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10,
                },
            },
            itemStyle: {
                normal: {
                    color: '#ffb137',
                    borderColor: 'rgba(239, 113,70,0.2)',
                    borderWidth: 12,
                },
            },
            data: [120, 110, 125, 105, 122, 105, 122, 120, 152, 111, 134, 150],
        },
        {
            name: '联通',
            type: 'line',
            smooth: true,
            symbol: 'circle',
            symbolSize: 5,
            showSymbol: false,
            lineStyle: {
                normal: {
                    width: 1,
                },
            },
            areaStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(
                        0,
                        0,
                        0,
                        1,
                        [
                            {
                                offset: 0,
                                color: '#00FFE3',
                            },
                            {
                                offset: 1,
                                color: 'rgba(21, 61, 132, 0.1)',
                            },
                        ],
                        false,
                    ),
                    shadowColor: 'rgba(0, 0, 0, 0.1)',
                    shadowBlur: 10,
                },
            },
            itemStyle: {
                normal: {
                    color: '#83a8fb',
                    borderColor: 'rgba(21, 61, 132,0.2)',
                    borderWidth: 12,
                },
            },
            data: [220, 182, 125, 145, 122, 191, 134, 150, 120, 110, 165, 122],
        },
    ],
};

let dataas = [
    {
        month: '1月',
        value: 138,
        ratio: 14.89,
    },

    {
        month: '2月',
        value: 114,
        ratio: 79.49,
    },

    {
        month: '3月',
        value: 714,
        ratio: 75.8,
    },

    {
        month: '4月',
        value: 442,
        ratio: 19.8,
    },

    {
        month: '5月',
        value: 622,
        ratio: 44.5,
    },

    {
        month: '6月',
        value: 528,
        ratio: 87.3,
    },
];

let xAxisMonth = [],
    barData = [],
    lineData1 = [];
for (let i = 0; i < dataas.length; i++) {
    xAxisMonth.push(dataas[i].month);
    barData.push({
        name: xAxisMonth[i],
        value: dataas[i].value,
    });
    lineData1.push({
        name: xAxisMonth[i],
        value: dataas[i].ratio,
    });
}
let colorList = [
    'rgba(215,56,126,0.6)',
    'rgba(2,173,186,0.6)',
    'rgba(215,56,126,0.6)',
    'rgba(2,173,186,0.6)',
    'rgba(215,56,126,0.6)',
    'rgba(2,173,186,0.6)',
];
export const ApOption = {
    title: '',
    grid: {
        top: '4%',
        left: '1%',
        bottom: '6%',
        containLabel: true,
    },
    xAxis: {
        boundaryGap: true,
        type: 'category',
        show: true,
        data: ['3月', '4月', '5月', '6月', '7月', '8月'],
        axisLabel: {
            textStyle: {
                color: '#c9dcf5',
            },
        },
    },
    yAxis: {
        show: false,
        type: 'value',
        nameTextStyle: {
            color: '#c9dcf5',
        },
        axisLabel: {
            color: '#c9dcf5',
        },
        splitLine: {
            show: false,
        },
        axisLine: {
            show: false,
            color: '#c9dcf5',
        },
        axisTick: {
            show: false,
        },
    },

    series: [
        {
            name: '训练人次',
            type: 'pictorialBar',
            barCategoryGap: '-50%',
            // barCategoryGap: '-5%',
            symbol: 'path://d="M150 50 L130 130 L170 130  Z"',
            itemStyle: {
                normal: {
                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                        {
                            offset: 0,
                            color: '#00FFE3',
                        },
                        {
                            offset: 1,
                            color: '#ffb137',
                        },
                    ]),
                },
                emphasis: {
                    opacity: 1,
                },
            },
            data: barData,
            label: {
                show: true,
                position: 'top',
                valueAnimation: true,
                textStyle: {
                    color: '#c9dcf5',
                    fontSize: '10',
                },
            },
        },
    ],
};

var value = 0.21;
var wdata = [value, value, value];
export const WaterOptions = {
    title: [
        {
            text: value.toFixed(1) + '℃',
            left: '50%',
            top: '35%',
            textAlign: 'center',
            textStyle: {
                fontSize: '30',
                fontWeight: '400',
                color: '#c9dcf5',
                textAlign: 'center',
                textBorderColor: 'rgba(0, 0, 0, 0)',
                textShadowColor: '#000',
                textShadowBlur: '0',
                textShadowOffsetX: 0,
                textShadowOffsetY: 1,
            },
        },
    ],
    series: [
        {
            type: 'liquidFill',
            radius: '78%',
            center: ['50%', '50%'],
            color: ['#ffb137', '#ffb137', '#ffb137'], //水波
            data: wdata, // data个数代表波浪数
            label: {
                normal: {
                    show: false,
                    textStyle: {
                        color: '#c9dcf5',
                    },
                },
            },
            backgroundStyle: {
                borderWidth: 1,
                color: 'transparent',
            },

            outline: {
                show: true,
                itemStyle: {
                    borderColor: '#ffb137',
                    borderWidth: 2,
                },
                borderDistance: 3,
            },
        },
    ],
};

export const PieBarOptions = {
    polar: {
        radius: [30, '80%']
    },
    angleAxis: {
        max: 1,
        startAngle: 75,
        axisLine: {
            lineStyle: {
                color: '#c9dcf5'
            }
        }
    },
    radiusAxis: {
        type: 'category',
        data: myData1,
        axisLine: {
            lineStyle: {
                color: '#c9dcf5'
            }
        }
    },
    tooltip: {},
    series: {
        type: 'bar',
        data: antiSkid,
        coordinateSystem: 'polar',
        itemStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                {offset: 0, color: '#83bff6'},
                {offset: 0.5, color: '#188df0'},
                {offset: 1, color: '#188df0'}
            ])
        },
        emphasis: {
            itemStyle: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                    {offset: 0, color: '#2378f7'},
                    {offset: 0.7, color: '#2378f7'},
                    {offset: 1, color: '#83bff6'}
                ])
            }
        },
        label: {
            show: true,
            position: 'middle',
        }
    }
};
