void main() {
  int n = 10; // จำนวนตัวเลข Fibonacci ที่ต้องการสร้าง
  List<int> fibonacciNumbers = generateFibonacci(n);

  print('Fibonacci Numbers:');
  print(fibonacciNumbers);
}

List<int> generateFibonacci(int n) {
  List<int> fibonacci = [];

  if (n <= 0) {
    return fibonacci;
  }

  fibonacci.add(0);

  if (n == 1) {
    return fibonacci;
  }

  fibonacci.add(1);

  for (int i = 2; i < n; i++) {
    int nextNumber = fibonacci[i - 1] + fibonacci[i - 2];
    fibonacci.add(nextNumber);
  }

  return fibonacci;
}
