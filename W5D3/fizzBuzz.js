function fizzBuzz(array) {
  let fizzes = [];
  for (let i = 0; i < array.length; i++) {
    let num = array[i];

    if ((num % 3 === 0) ^ (num % 5 === 0)) {
      fizzes.push(num);
    }
  }

  return fizzes;
}

console.log(fizzBuzz([3, 5, 15, 7, 25, 27]));
