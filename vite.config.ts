
import { defineConfig, searchForWorkspaceRoot, loadEnv } from 'vite';
import { resolve } from 'path'
import vue from '@vitejs/plugin-vue';
import html from 'vite-plugin-html';
import WindiCSS from 'vite-plugin-windicss';
import vueJsx from '@vitejs/plugin-vue-jsx'
export default ({ command, mode }) => {
  const modes = process.env.VITE_ENV ?? mode;
  const env = loadEnv(`${modes}`, process.cwd());
  return defineConfig({
    resolve: {
      alias: {
        '@': resolve(__dirname, './src'),
        packages: resolve(__dirname, './packages'),
      },
    },
    plugins: [
      vue({ include: [/\.vue$/] }),
      vueJsx(),
      html({
        minify: false,
        inject: {
          data: {
            title:'Windcss',
          }
        },
      }),
      WindiCSS()
    ],
    build: {
      target: 'esnext',
      outDir: 'docs',
      brotliSize: false,
      chunkSizeWarningLimit: 2000,
    },
    logLevel: 'info',
    server: {
      proxy:{
          "/geojson":{
            target:'https://geo.datav.aliyun.com/',
            changeOrigin:true,
            rewrite:path => path.replace(/^\/geojson/, '')
          },
          "/datas":{
            target:'https://lab.isaaclin.cn/nCoV/',
            changeOrigin:true,
            rewrite:path => path.replace(/^\/datas/, '')
          },
          "/apinews":{
            target:'https://c.m.163.com/',
            changeOrigin:true,
            rewrite:path => path.replace(/^\/apinews/, '')
          }
      },
      fs: {
        allow: [
          searchForWorkspaceRoot(process.cwd()),
          '/path/to/custom/allow'
        ]
      }
    }
  });
}

