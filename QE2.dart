class Queue {
  int front = 0, rear = 0, size = 0, capacity = 0;
  late List<int> array;

  // Constructor
  Queue(int capacity) {
    this.capacity = capacity;
    front = size = 0;
    rear = capacity - 1;
    array = List<int>.filled(capacity, 0);
  }

  bool isFull() {
    return size == capacity;
  }

  bool isEmpty() {
    return size == 0;
  }

  void enqueue(int item) {
    if (isFull()) return;
    rear = (rear + 1) % capacity;
    array[rear] = item;
    size++;
    print('$item enqueued to queue');
  }

  int dequeue() {
    if (isEmpty()) return -1;
    int item = array[front];
    front = (front + 1) % capacity;
    size--;
    return item;
  }

  int frontElement() {
    return isEmpty() ? -1 : array[front];
  }

  int rearElement() {
    return isEmpty() ? -1 : array[rear];
  }
}

void main() {
  Queue q = Queue(1000);
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  print('Dequeued: ${q.dequeue()}');
  print('Front element: ${q.frontElement()}');
  print('Rear element: ${q.rearElement()}');
}
