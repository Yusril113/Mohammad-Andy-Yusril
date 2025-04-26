class MyQueue {
  late List<int> elements;
  int front = -1;
  int rear = -1;
  int maxQueue = 0;

  void queueOperation(int max) {
    front = -1;
    rear = -1;
    elements = List<int>.filled(max, 0);
    maxQueue = max;
  }

  bool isEmpty() {
    return front == -1;
  }

  bool isFull() {
    return (rear + 1) % maxQueue == front;
  }

  void enqueue(int data) {
    if (isFull()) {
      print("Queue Overflow, tidak dapat mengisi data lagi");
    } else {
      if (isEmpty()) {
        front = 0;
      }
      rear = (rear + 1) % maxQueue;
      elements[rear] = data;
    }
  }

  int dequeue() {
    if (isEmpty()) {
      print("Queue Underflow");
      return -1;
    } else {
      int data = elements[front];
      elements[front] = 0;
      if (front == rear) {
        // Queue menjadi kosong setelah dequeue
        front = -1;
        rear = -1;
      } else {
        front = (front + 1) % maxQueue;
      }
      return data;
    }
  }

  void display() {
    if (isEmpty()) {
      print("Antrian kosong");
    } else {
      print("Elemen dalam antrian:");
      int i = front;
      while (true) {
        print(elements[i]);
        if (i == rear) break;
        i = (i + 1) % maxQueue;
      }
    }
  }
}

void main() {
  MyQueue q = MyQueue();
  q.queueOperation(5); // Kapasitas queue 5

  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.enqueue(40);
  q.enqueue(50); // Akan Overflow karena hanya 4 bisa diisi dalam circular (1 slot kosong untuk deteksi penuh)
  q.display();

  print("Dequeue: ${q.dequeue()}");
  print("Dequeue: ${q.dequeue()}");
  q.enqueue(60);
  q.enqueue(70);
  q.display(); // Sekarang 30, 40, 60, 70
}
