void insertionSortRightToLeft(List<int> arr, {bool ascending = true}) {
  int n = arr.length;

  for (int i = n - 2; i >= 0; i--) { // Mulai dari elemen kedua dari belakang
    int key = arr[i];
    int j = i + 1;jika sesuai kondisi sorting


    // Geser elemen ke kiri     while (j < n && ((arr[j] < key && ascending) || (arr[j] > key && !ascending))) {
      arr[j - 1] = arr[j];
      j++;
    }

    arr[j - 1] = key; // Tempatkan elemen di posisi yang benar
  }
}

void main() {
  List<int> data = [9, 5, 1, 4, 3];

  // Sorting dari kanan ke kiri secara ascending
  List<int> ascendingList = List.from(data);
  insertionSortRightToLeft(ascendingList, ascending: true);
  print("Ascending: $ascendingList");

  // Sorting dari kanan ke kiri secara descending
  List<int> descendingList = List.from(data);
  insertionSortRightToLeft(descendingList, ascending: false);
  print("Descending: $descendingList");
}
