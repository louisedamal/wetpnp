import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Simple, efficace, et fun."],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
