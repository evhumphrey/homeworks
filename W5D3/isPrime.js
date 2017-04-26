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

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863)); // true
console.log(isPrime(3548563)); // true
