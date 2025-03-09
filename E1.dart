// Fungsi rekursif untuk menghitung koefisien binomial (C(n, k))
int kombinasi(int n, int k) {
  if (k == 0 || k == n) {
    return 1; // Nilai di tepi segitiga Pascal selalu 1
  }
  return kombinasi(n - 1, k - 1) + kombinasi(n - 1, k); // Rekursi Pascal
}

// Fungsi untuk mencetak Segitiga Pascal dengan format segitiga
void segitigaPascal(int baris) {
  for (int i = 0; i < baris; i++) {
    // Menambahkan spasi agar tampilan berbentuk segitiga
    String spasi = ' ' * (baris - i);
    List<int> row = [];
    for (int j = 0; j <= i; j++) {
      row.add(kombinasi(i, j)); // Mengisi nilai dengan kombinasi rekursif
    }
    print(spasi + row.join(" ")); // Cetak baris Pascal dengan spasi
  }
}

void main() {
  segitigaPascal(6); // Menampilkan Segitiga Pascal hingga F6
}
