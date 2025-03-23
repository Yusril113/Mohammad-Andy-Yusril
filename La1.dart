void quickSortDescending(List<int> arr, int low, int high) {
  if (low < high) {
    int pi = partitionDescending(arr, low, high);
    quickSortDescending(arr, low, pi - 1);
    quickSortDescending(arr, pi + 1, high);
  }
}

int partitionDescending(List<int> arr, int low, int high) {
  int pivot = arr[high]; // Pilih pivot sebagai elemen terakhir
  int i = low - 1;

  for (int j = low; j < high; j++) {
    if (arr[j] > pivot) { // Perbandingan untuk sorting descending
      i++;
      // Tukar arr[i] dengan arr[j]
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  // Tukar pivot dengan elemen setelah i
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

void main() {
  List<int> data = [9, 5, 1, 4, 3];

  // Sorting menggunakan Quick Sort secara descending
  List<int> quickSortDescendingList = List.from(data);
  quickSortDescending(quickSortDescendingList, 0, quickSortDescendingList.length - 1);
  print("Quick Sort Descending: $quickSortDescendingList");
}
