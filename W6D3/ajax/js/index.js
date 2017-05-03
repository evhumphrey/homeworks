console.log("Hello from the JavaScript console!");

// Your AJAX request here (note success and error are functions)
$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b',
  success(data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error() {
    console.error("An error has occured.");
  }
});

// Add another console log here, outside your AJAX request
console.log("I'm below the AJAX request (in the js file)");
