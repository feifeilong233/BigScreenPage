import { defineConfig } from 'vite-plugin-windicss';
import colors from 'windicss/colors';
import typography from 'windicss/plugin/typography';
export default defineConfig({
  safelist: ['prose', 'prose-sm', 'm-auto'],
  darkMode: 'class',
  plugins: [typography,EnterStylePlugin()],
  theme: {
    extend: {
      colors: {
        teals: colors.teal,
      },
    }
  }
})


// windi 组件开发
function EnterStylePlugin(maxNum=8){
      const createCss = (index:number,type='y',direction='r')=>{
            const upd = type.toUpperCase();
            const lrd = direction;
            return {
               [`*> .enter-${type}:nth-child(${index})`]:{
                      transform:`translate${upd}(50px)`,
                     'z-index': `${10 - index}`,
                     opacity: '0',
                     animation: `enter-${type}-animation 0.4s ease-in-out 0.3s`,
                     'animation-fill-mode': 'forwards',
                     'animation-delay': `${(index * 1) / 10}s`,
               },
               [`*> .enter-${type}-${direction}:nth-child(${index})`]:{
                transform:`translate${upd}(${lrd=='r'?'50px':'-50px'})`,
               'z-index': `${10 - index}`,
               opacity: '0',
               animation: `enter-${type}-animation 0.4s ease-in-out 0.3s`,
               'animation-fill-mode': 'forwards',
               'animation-delay': `${(index * 1) / 10}s`,
               }
            } 
      }
      // 自定义插件必须存在一个handler的入口函数
      // 当前api enter-x-r/enter-x-l/enter-y(enter-y-r)
      const handler = ({addBase})=>{
      //  handler 参数中会存在两个拓展参数addBase（可以通过此属性进行添加自定义函数）, theme(可以在默认主题中提取样式)
          const addRawCss = {};
          for(let n = 0;n<maxNum;n++){
              Object.assign(addRawCss,{
                    ...createCss(n,'x','r'),
                    ...createCss(n,'x','l'),
                    ...createCss(n,'y','r'),
                    ...createCss(n,'y','l')
              })
          }
          addBase({
            ...addRawCss,
            [`@keyframes enter-x-animation`]: {
              to: {
                opacity: '1',
                transform: 'translateX(0)',
              },
            },
            [`@keyframes enter-y-animation`]: {
              to: {
                opacity: '1',
                transform: 'translateY(0)',
              },
            },
          });
      }
      return {handler};
}
