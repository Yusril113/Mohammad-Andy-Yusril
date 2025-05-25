import 'dart:io';

class Node<T> {
  T nodeValue;
  Node? left, right;

  Node(this.nodeValue);
}

class BinaryTree {
  Node? root;

  // Menambahkan data ke node target (linear search)
  bool insertAtTarget(dynamic target, dynamic newValue) {
    if (root == null) return false;

    List<Node> queue = [root!];

    while (queue.isNotEmpty) {
      Node current = queue.removeAt(0);

      if (current.nodeValue == target) {
        if (current.left == null) {
          current.left = Node(newValue);
          return true;
        } else if (current.right == null) {
          current.right = Node(newValue);
          return true;
        } else {
          return false; // anak sudah penuh
        }
      }

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }

    return false; // target tidak ditemukan
  }

  // PreOrder Traversal
  void printPreorder(Node? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  // InOrder Traversal
  void printInOrder(Node? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write('${node.nodeValue} ');
      printInOrder(node.right);
    }
  }

  // PostOrder Traversal
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

  Btree.root = Node("a");
  Btree.root!.left = Node(1);
  Btree.root!.left!.left = Node(3);
  Btree.root!.left!.right = Node(4);
  Btree.root!.right = Node(2);
  Btree.root!.right!.left = Node(5);

  // Tambah node baru berdasarkan target
  bool success = Btree.insertAtTarget(2, "X");
  if (success) {
    print("Berhasil menambahkan node 'X' ke node dengan nilai 2.");
  } else {
    print("Gagal menambahkan node.");
  }

  print("\nPreOrder traversal of binary tree is: ");
  Btree.printPreorder(Btree.root);

  print("\n\nInOrder traversal of binary tree is: ");
  Btree.printInOrder(Btree.root);

  print("\n\nPostOrder traversal of binary tree is: ");
  Btree.printPostoder(Btree.root);
}
