void mergeSort(List<int> arr, bool ascending) {
  if (arr.length <= 1) return;

  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);

  mergeSort(left, ascending);
  mergeSort(right, ascending);

  merge(arr, left, right, ascending);
}

void merge(List<int> arr, List<int> left, List<int> right, bool ascending) {
  int i = 0, j = 0, k = 0;

  while (i < left.length && j < right.length) {
    if ((left[i] < right[j] && ascending) || (left[i] > right[j] && !ascending)) {
      arr[k++] = left[i++];
    } else {
      arr[k++] = right[j++];
    }
  }

  while (i < left.length) arr[k++] = left[i++];
  while (j < right.length) arr[k++] = right[j++];
}

void main() {
  List<int> data = [9, 5, 1, 4, 3];

  // Sorting menggunakan Merge Sort secara descending
  List<int> mergeSortDescendingList = List.from(data);
  mergeSort(mergeSortDescendingList, false);
  print("Merge Sort Descending: $mergeSortDescendingList");
}
