class CircularQueue<T> {
  late List<T?> _queue;
  int _front = -1;
  int _rear = -1;
  final int _maxSize;

  CircularQueue(this._maxSize) {
    _queue = List<T?>.filled(_maxSize, null);
  }

  bool isEmpty() => _front == -1;

  bool isFull() => (_rear + 1) % _maxSize == _front;

  void enqueue(T data) {
    if (isFull()) {
      print("Queue Overflow: tidak dapat menambahkan $data");
      return;
    }

    if (isEmpty()) {
      _front = 0;
    }

    _rear = (_rear + 1) % _maxSize;
    _queue[_rear] = data;
    print("Enqueue: $data");
  }

  T? dequeue() {
    if (isEmpty()) {
      print("Queue Underflow: tidak ada elemen untuk dihapus");
      return null;
    }

    T? removedData = _queue[_front];
    _queue[_front] = null;

    if (_front == _rear) {
      _front = -1;
      _rear = -1;
    } else {
      _front = (_front + 1) % _maxSize;
    }

    print("Dequeue: $removedData");
    return removedData;
  }

  void display() {
    if (isEmpty()) {
      print("Queue kosong");
      return;
    }

    print("Isi queue:");
    int i = _front;
    while (true) {
      print(_queue[i]);
      if (i == _rear) break;
      i = (i + 1) % _maxSize;
    }
  }
}
void main() {
  // Queue integer
  CircularQueue<int> intQueue = CircularQueue<int>(4);
  intQueue.enqueue(10);
  intQueue.enqueue(20);
  intQueue.enqueue(30);
  intQueue.display();
  intQueue.dequeue();
  intQueue.enqueue(40);
  intQueue.enqueue(50); // Akan overflow
  intQueue.display();

  print("====");

  // Queue string
  CircularQueue<String> stringQueue = CircularQueue<String>(3);
  stringQueue.enqueue("A");
  stringQueue.enqueue("B");
  stringQueue.enqueue("C");
  stringQueue.display();
  stringQueue.dequeue();
  stringQueue.enqueue("D");
  stringQueue.display();
}
