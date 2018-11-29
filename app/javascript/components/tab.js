const tabControl = () => {
  const ownerTab = document.getElementById('owner-trigger');
  const swimmerTab = document.getElementById('swimmer-trigger');
  if (ownerTab && swimmerTab) {
    ownerTab.addEventListener('click', (event) => {
      event.preventDefault();
      ownerTab.classList.add('active');
      swimmerTab.classList.remove('active');
      document.getElementById('owner').classList.remove('hidden')
      document.getElementById('swimmer').classList.add('hidden')
    });
    swimmerTab.addEventListener('click', (event) => {
      event.preventDefault();
      swimmerTab.classList.add('active');
      ownerTab.classList.remove('active');
      document.getElementById('swimmer').classList.remove('hidden')
      document.getElementById('owner').classList.add('hidden')
    });
  }
}

export { tabControl };
