void selectionSortRightToLeft(List<int> arr, {bool ascending = true}) {
  int n = arr.length;

  for (int i = n - 1; i > 0; i--) { // Iterasi dari kanan ke kiri
    int extremeIndex = i; // Posisi elemen minimum/maksimum

    for (int j = i - 1; j >= 0; j--) {
      if ((arr[j] < arr[extremeIndex] && ascending) || 
          (arr[j] > arr[extremeIndex] && !ascending)) {
        extremeIndex = j;
      }
    }

    // Swap jika ditemukan elemen yang lebih kecil/besar
    if (extremeIndex != i) {
      int temp = arr[i];
      arr[i] = arr[extremeIndex];
      arr[extremeIndex] = temp;
    }
  }
}

void main() {
  List<int> data = [9, 5, 1, 4, 3];

  // Sorting dari kanan ke kiri secara ascending
  List<int> ascendingList = List.from(data);
  selectionSortRightToLeft(ascendingList, ascending: true);
  print("Ascending: $ascendingList");

  // Sorting dari kanan ke kiri secara descending
  List<int> descendingList = List.from(data);
  selectionSortRightToLeft(descendingList, ascending: false);
  print("Descending: $descendingList");
}
