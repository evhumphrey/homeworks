function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${name} the elephant goes 'phrRRRR!'`);
};
Elephant.prototype.grow = function() {
  this.height += 12;
};

Elephant.prototype.addTrick = function(trick) {
  this.trick.push(trick);
};

Elephant.prototype.play = function() {
  console.log('trick');
};
