import 'dart:io';
import 'dart:collection'; // untuk Queue

class Node<T> {
  T nodeValue;
  Node? left, right;

  Node(this.nodeValue);
}

class BinaryTree {
  Node? root;

  // Menambahkan node berdasarkan Level Order
  void insertLevelOrder(dynamic value) {
    Node newNode = Node(value);

    if (root == null) {
      root = newNode;
      return;
    }

    Queue<Node> queue = Queue<Node>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      Node current = queue.removeFirst();

      if (current.left == null) {
        current.left = newNode;
        break;
      } else {
        queue.add(current.left!);
      }

      if (current.right == null) {
        current.right = newNode;
        break;
      } else {
        queue.add(current.right!);
      }
    }
  }

  // Preorder Traversal
  void printPreorder(Node? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  // Inorder Traversal
  void printInOrder(Node? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write('${node.nodeValue} ');
      printInOrder(node.right);
    }
  }

  // Postorder Traversal
  void printPostoder(Node? node) {
    if (node != null) {
      printPostoder(node.left);
      printPostoder(node.right);
      stdout.write('${node.nodeValue} ');
    }
  }
}

void main() {
  BinaryTree Btree = BinaryTree();

  // Menambahkan elemen ke dalam tree menggunakan Level Order
  Btree.insertLevelOrder("a");
  Btree.insertLevelOrder(1);
  Btree.insertLevelOrder(2);
  Btree.insertLevelOrder(3);
  Btree.insertLevelOrder(4);
  Btree.insertLevelOrder(5);

  print("PreOrder traversal of binary tree is: ");
  Btree.printPreorder(Btree.root);

  print("\nInOrder traversal of binary tree is: ");
  Btree.printInOrder(Btree.root);

  print("\nPostOrder traversal of binary tree is: ");
  Btree.printPostoder(Btree.root);
}
