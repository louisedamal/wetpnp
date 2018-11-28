import "bootstrap";

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';

initUpdateNavbarOnScroll();
loadDynamicBannerText();
initMapbox();
