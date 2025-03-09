void generateCombinations(String current, int n, int length) {
  if (current.length == length) {
    print(current);
    return;
  }

  for (var char in ['a', 'b', 'c']) {
    generateCombinations(current + char, n, length);
  }
}

void main() {
  int n = 3; // Jumlah karakter dalam kombinasi
  generateCombinations("", 3, n);
}
