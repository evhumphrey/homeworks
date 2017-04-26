function isSubstring(searchString, subString) {
  let found = searchString.includes(subString);
  return found;
}

console.log(isSubstring("time to program", "time")); // true
console.log(isSubstring("Jump for joy", "joys")); // false
