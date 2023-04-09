import L from 'leaflet';
import 'leaflet.chinatmsproviders';
import type { MarkerOptions } from 'leaflet';
import { ref, unref } from '@vue/runtime-core';
import { isArray } from '@vue/shared';
import { getGeoJson } from '@/lib/getGeoJson';
import { watch } from 'vue';
let provinces = ref<any>(false);
// 将省份数据恢复默认
export const clearProvinces = () => {
  provinces.value = false;
};
export const useLeaflet = (idName) => {
  let feiLineGroupLayer = ref(L.layerGroup([]));
  let feiMakerGroupLayer = ref(L.layerGroup([]));
  let feiMakerPopGroupLayer = ref(L.layerGroup([]));
  let acroutes = ref([100000]);
  let latlngArr = ref({});
  let datasArr = ref<any>([]);
  let geoarr = ref<any>(L.layerGroup([]));
  let map = ref<any>(null);
  //
  // 初始化地图
  const initMap = (options, cb) => {
    map.value = L.map(idName, options);
    // 监听地图点击事件
    // map.value.on("click", function (e) {
    // });
    const attrs = L.control.attribution({ prefix: '疫情地图' });
    attrs.addTo(map.value);
    // @ts-ignore
    L.tileLayer?.chinaProvider('Geoq.Normal.PurplishBlue').addTo(map.value);
    map.value.setView([41.02999636902566, 108.984375], 3);
    //持续回调
    watch(
      () => unref(provinces),
      (e) => {
        cb(provinces.value);
      },
      { immediate: true },
    );
    // 键盘监听;
    document.onkeydown = (es) => {
      // console.log()
      var e = es || window.event;
      // 按下按键 && 当前的provinces的值必须有效
      if (e.keyCode == 8 && provinces.value) {
        clearConfigs();
        map.value.fitBounds([
          [58.49369382056807, 145.45898437500003],
          [17.308687886770034, 72.50976562500001],
        ]);
        setTimeout(() => {
          clearProvinces();
        }, 1500);
      }
    };
  };
  const clearConfigs = () => {
    geoarr.value.clearLayers(geoarr.value);
    feiLineGroupLayer.value.clearLayers();
    feiMakerGroupLayer.value.clearLayers();
    feiMakerPopGroupLayer.value.clearLayers();
    acroutes.value = [100000];
    datasArr.value.pop();
    latlngArr.value = {};
    // map.value.removeLayer(geoarr.value);
    // map.value.removeLayer(feiLineGroupLayer.value);
  };
  // Geo事件
  // 核心函数 渲染地图Geo
  const updateGeoJson = (json) => {
    if (isArray(json) && json.length < 1) {
      return;
    }
    // 每次跨层级清除面板-- 性能优化
    map.value.removeLayer(geoarr.value);
    feiLineGroupLayer.value.clearLayers();
    feiMakerGroupLayer.value.clearLayers();
    // 遍历json
    json.forEach((item, index) => {
      let areaName = item.properties.name;
      let Areaitems =
        datasArr.value[datasArr.value.length - 1][
          areaName.replace(/(省|市|自治区|维吾尔自治区)$/g, '')
        ];
      let colors = Areaitems ?? '#008c8c';
      const onEachFeature = (feature, layer) => {
        layer.on({
          mouseover: (e) => {
            //// 添加样式
            // let {center:latlng,name} = e.target.feature.properties;
            // CeatePopus(latlng,datasArr.value[datasArr.value.length-1][name.replace(/(省|市|自治区|维吾尔自治区)$/g,'')]);
          },
          mouseout: (e) => {
            // 鼠标移除 清除样式
            // geojson.resetStyle(e.target);
          },
          click: (e) => {
            // 点击添加點
            let codes = e.target.feature.properties.adcode;
            let { name } = e.target.feature.properties;
            if (acroutes.value.length > 1) {
              return;
            }
            // console.log(datasArr.value[datasArr.value.length-1][name.replace(/(省|市|自治区|维吾尔自治区)$/g,'')].children);
            let prov =
              datasArr.value[datasArr.value.length - 1][
                name.replace(/(省|市|自治区|维吾尔自治区)$/g, '')
              ];
            let childrenArr = prov.children;
            let objs = {};
            provinces.value = prov;
            childrenArr.map((item, index) => {
              objs[item.name] = item;
            });
            datasArr.value.push(objs);
            acroutes.value.push(codes);
            map.value.fitBounds(e.target.getBounds());
            getGeoJson(`${codes}_full`).then((res) => {
              geoarr.value.clearLayers(geoarr.value);
              setTimeout(() => {
                updateGeoJson(res);
              }, 100);
            });
          },
        });
      };
      // 记录每个地区经纬度
      latlngArr.value[item.properties.name] = item.properties.center;
      // 添加geo模块
      // 更改区域颜色
      let geojson = L.geoJSON(item, {
        style: {
          weight: 2, //边框粗细
          opacity: 0.4, //透明度
          fillColor: 'transparent', //区域填充颜色
          fillOpacity: 0.3, //区域填充颜色的透明
        },
        onEachFeature: onEachFeature,
      });
      // 更换背景
      setTimeout(() => {
        geojson.setStyle({
          weight: 1,
          color: '#666',
          dashArray: '',
          fillOpacity: 0.3,
          fillColor: `rgba(21,192,203,0.58)`,
        });
      }, 100 + index * 0);
      geoarr.value.addLayer(geojson);
    });
    map.value.addLayer(geoarr.value);
    setTimeout(() => {
      AddmarksA(json);
    }, 1000);
  };
  const AddmarksA = (json) => {
    map.value.removeLayer(feiLineGroupLayer.value);
    json.forEach((item, index) => {
      let areaName = item.properties.name;
      let Areaitems =
        datasArr.value[datasArr.value.length - 1][
          areaName.replace(/(省|市|自治区|维吾尔自治区)$/g, '')
        ];
      let colors = Areaitems ?? '#008c8c';
      // geo标注
      if (item && item.properties.center) {
        markripple(
          item.properties.center,
          bgcolors(colors),
          datasArr.value[datasArr.value.length - 1][
            areaName.replace(/(省|市|自治区|维吾尔自治区)$/g, '')
          ],
        );
      }
    });
    map.value.addLayer(feiLineGroupLayer.value);
  };
  // bgcolors
  const bgcolors = (Areaitems) => {
    if (!Areaitems || !Areaitems.total) {
      return { color: '#ccc', width: '9' };
    }
    let { total } = Areaitems;
    // console.log(total.confirm>20);
    let color = { color: '#67e8f9', width: '9' };
    switch (true) {
      case total.confirm >= 10 && total.confirm < 20:
        color = { color: '#67e8f9', width: '9' };
        break;
      case total.confirm >= 20 && total.confirm < 50:
        color = { color: '#67e8f9', width: '9' };
        break;
      case total.confirm >= 50 && total.confirm < 70:
        color = { color: '#10b981', width: '9' };
        break;
      case total.confirm >= 70 && total.confirm < 90:
        color = { color: '#fbbf24', width: '9' };
        break;
      case total.confirm >= 90 && total.confirm < 110:
        color = { color: '#34d399', width: '9' };
        break;
      case total.confirm >= 110 && total.confirm < 150:
        color = { color: '#bef264', width: '9' };
        break;
      case total.confirm >= 150 && total.confirm < 380:
        color = { color: '#fbbf24', width: '9' };
        break;
      case total.confirm >= 380 && total.confirm < 610:
        color = { color: '#ea580c', width: '9' };
        break;
      case total.confirm >= 610 && total.confirm < 1000:
        color = { color: '#fbbf24', width: '9' };
        break;
      case total.confirm >= 1000 && total.confirm < 1500:
        color = { color: '#f87171', width: '9' };
        break;
      case total.confirm >= 1500 && total.confirm < 2000:
        color = { color: '#ef4444', width: '9' };
        break;
      case total.confirm >= 2000 && total.confirm < 3050:
        color = { color: '#dc2626', width: '9' };
        break;
      case total.confirm >= 3050 && total.confirm < 5850:
        color = { color: '#b91c1c', width: '9' };
        break;
      case total.confirm >= 5850 && total.confirm < 8050:
        color = { color: '#991b1b', width: '9' };
        break;
      case total.confirm >= 8050:
        color = { color: 'red', width: '17' };
        break;
      default:
        color = { color: '#67e8f9', width: '3' };
        break;
    }
    return color;
  };
  // iCon标点
  const iConMaker = (imgUrl, latlng) => {
    const iconEnd = L.icon({
      iconUrl: imgUrl,
      iconSize: [20, 20],
      iconAnchor: [5, 5],
      shadowSize: [0, 0],
    });
    let makerEnd = L.marker([latlng[1], latlng[0]], {
      id: 'aaa',
      icon: iconEnd,
    } as { id: string } & MarkerOptions);
    feiMakerGroupLayer.value?.addLayer(makerEnd);
  };
  // 弹窗
  const CeatePopus = (latlng, names) => {
    let name = unref(names);
    if (!name) return;
    let popup = L.popup()
      .setLatLng([latlng[1], latlng[0]])
      .setContent(
        `<p>区域名称${name.name}!<br />累计确诊人数：${name.total.confirm}</p>`,
      )
      .openOn(map.value);
    return popup;
  };
  // 鼠标进入触发弹窗
  const CreateLaryerspop = (arr) => {
    let objs = {};
    arr.map((item, index) => {
      // feiMakerPopGroupLayer
      if (index < 6) {
        markAndpop(item);
      }
      objs[item.name] = item;
    });
    datasArr.value.push(objs);
    map.value.addLayer(feiMakerPopGroupLayer.value);
    CeatePopus(
      [114.502461, 38.045474],
      datasArr.value[datasArr.value.length - 1]['河北'],
    );
  };
  // 标记
  const markAndpop = (name) => {
    if (latlngArr.value[name.provinceName]) {
      let popup = L.popup()
        .setLatLng([
          latlngArr.value[name.provinceName][1],
          latlngArr.value[name.provinceName][0],
        ])
        .setContent(
          `<p>Hello ${name.provinceName}!<br />现存确诊人数：${name.currentConfirmedCount}.</p>`,
        )
        .openOn(map.value);
      feiMakerPopGroupLayer.value.addLayer(popup);
    }
  };
  // tootip
  // 波浪点
  const markripple = (latlng, color, items) => {
    if (!items) return;
    let html = `<div class="container" style="background:#15c2cb;width:${
      color.width * 1 + 5
    }px;height:${color.width * 1 + 5}px">
                <div class="bar" style="background:#15c2cb"></div>  
                <div class="water1"></div> 
                <div class="water2"></div> 
               </div>`;
    var myIcon = L.divIcon({ className: 'my-div-icon', html });
    let bmarker = L.marker([latlng[1], latlng[0]], {
      icon: myIcon,
      title: ' ',
    }).bindTooltip(
      `
  <div>
  <div>累计确诊：${items.total.confirm}</div>
  <div>地区名称：${items.name}</div>
  </div>
  `,
      {
        opacity: 0.9,
        direction: 'top',
        permanent: items.total.confirm > 10000,
      },
    );
    feiLineGroupLayer.value.addLayer(bmarker);
  };

  return {
    initMap,
    iConMaker,
    updateGeoJson,
    markripple,
    CeatePopus,
    CreateLaryerspop,
  };
};
