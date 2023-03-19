import { createApp } from 'vue';
import 'virtual:windi.css';
import App from './App.vue';
import { router } from './routers/basicRouter';
import install from 'vdatax/lib';
const app = createApp(App);
app.use(router);
app.use(install);
app.mount('#app');
