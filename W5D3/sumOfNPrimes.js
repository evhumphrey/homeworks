function sumOfNPrimes(n) {
  let count = 0;
  let sum = 0;

  let i = 2;
  while (true) {
    if (count === n) {
      break;
    }

    if (isPrime(i)) {
      sum += i;
      count++;
    }

    i++;
  }

  return sum;
}

// helper method
function isPrime(num) {
  if (num === 2) {
    return true;
  }

  for (let i = 2; i < num; i++) {

    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));
