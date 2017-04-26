function titleize(array, callback) {
  let formal = array.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });

  callback(formal);
}

titleize(["Mary", "Bob"], function(name) {
  console.log(name);
});
