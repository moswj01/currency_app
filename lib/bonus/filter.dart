void main() {
  List<int> array1 = [1, 2, 3, 4, 5];
  List<int> array2 = [2, 4, 6, 8, 10];

  List<int> filteredArray = filterArray(array1, array2);

  print('Filtered Array:');
  print(filteredArray);
}

List<int> filterArray(List<int> array1, List<int> array2) {
  List<int> filteredArray = [];

  for (int i = 0; i < array1.length; i++) {
    int currentNumber = array1[i];

    bool isPresent = false;

    for (int j = 0; j < array2.length; j++) {
      if (array2[j] == currentNumber) {
        isPresent = true;
        break;
      }
    }

    if (isPresent) {
      filteredArray.add(currentNumber);
    }
  }

  return filteredArray;
}
