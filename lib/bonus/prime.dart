void main() {
  int n = 20; // จำนวนจำนวนเฉพาะที่ต้องการสร้าง
  List<int> primeNumbers = generatePrimeNumbers(n);

  print('Prime Numbers:');
  print(primeNumbers);
}

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }

  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }

  return true;
}

List<int> generatePrimeNumbers(int n) {
  List<int> primeNumbers = [];
  int number = 2;

  while (primeNumbers.length < n) {
    if (isPrime(number)) {
      primeNumbers.add(number);
    }
    number++;
  }

  return primeNumbers;
}
