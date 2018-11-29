import "bootstrap";
import "../components/flatpickr"

import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox } from '../plugins/init_mapbox';
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { initAutocomplete } from '../components/init_autocomplete'
import { tabControl } from '../components/tab'


initUpdateNavbarOnScroll();
loadDynamicBannerText();
initMapbox();
initAutocomplete();
tabControl();
