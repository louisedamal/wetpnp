const tabControl = () => {
  const tabs = document.querySelectorAll('.tabs a');

  tabs.forEach((tab) => {
    tab.addEventListener('click', (e) => {
      const contents = document.querySelectorAll('.bookings');
      tabs.forEach((t) => { t.classList.toggle('active') });
      contents.forEach((content) => {
        content.classList.toggle('hidden');
      });
    });
  });
}

export { tabControl };
