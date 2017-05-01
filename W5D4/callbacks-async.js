// timeout
window.setTimeout(() => {
  window.alert("HAMMERTIME");
}, 5000);


// timeout plus closure
const hammerTime = (time) => {

  window.setTimeout(() => {
    window.alert(`${time} is Hammertime!`);
  }, time);
};
