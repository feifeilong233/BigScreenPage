export const typeEnum = [
    {
        type: 1,
        name: '行车道国际平整度指数(m/km)'
    },
    {
        type: 2,
        name: '行车道激光表面纹理深度(mm)'
    },
    {
        type: 3,
        name: '平均温度(℃)'
    },
    {
        type: 4,
        name: '轴载次数lg(Ne)'
    },
    {
        type: 5,
        name: '轴载次数Ne'
    },
    {
        type: 6,
        name: '行车道平均车辙深度（0.1mm）'
    },
    {
        type: 7,
        name: '中心点弯沉（0.1mm）'
    },
    {
        type: 8,
        name: 'T路表（℃）'
    },
    {
        type: 9,
        name: 'T大气（℃）'
    }
];

export const getCode = (type) => {
    const item = typeEnum.find((item) => item.type == type);
    return item ? item.name : type;
};
