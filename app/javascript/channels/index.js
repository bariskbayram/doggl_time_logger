// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

document.addEventListener("DOMContentLoaded", function(event) { 

  const start_checkbox = document.getElementById('start_checkbox');
  const stop_checkbox = document.getElementById('stop_checkbox');
        
  start_checkbox.addEventListener('change', (event) => {
    let el = document.getElementsByClassName('start-time')[0];
    if (event.currentTarget.checked) {
      el.style.display = 'block';
    } else {
      el.style.display = 'none';
    }
  });
        
        
  stop_checkbox.addEventListener('change', (event) => {
    let el = document.getElementsByClassName('stop-time')[0];
    if (event.currentTarget.checked) {
      el.style.display = 'block';
    } else {
      el.style.display = 'none';
    }
  });

});