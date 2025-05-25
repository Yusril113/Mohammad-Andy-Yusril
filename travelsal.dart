import 'dart:io';

class Node<T> {
  T value;
  Node? left, right;

  Node(this.value);
}

class BinaryTree {
  Node? root;

  // Non-Recursive PreOrder
  void printPreOrder() {
    if (root == null) return;
    List<Node> stack = [root!];

    while (stack.isNotEmpty) {
      Node node = stack.removeLast();
      stdout.write('${node.value} ');
      if (node.right != null) stack.add(node.right!);
      if (node.left != null) stack.add(node.left!);
    }
  }

  // Non-Recursive InOrder
  void printInOrder() {
    List<Node> stack = [];
    Node? current = root;

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }
      current = stack.removeLast();
      stdout.write('${current.value} ');
      current = current.right;
    }
  }

  // Non-Recursive PostOrder
  void printPostOrder() {
    if (root == null) return;
    List<Node> stack1 = [root!];
    List<Node> stack2 = [];

    while (stack1.isNotEmpty) {
      Node node = stack1.removeLast();
      stack2.add(node);
      if (node.left != null) stack1.add(node.left!);
      if (node.right != null) stack1.add(node.right!);
    }

    while (stack2.isNotEmpty) {
      stdout.write('${stack2.removeLast().value} ');
    }
  }
}

void main() {
  BinaryTree tree = BinaryTree();

  // Buat struktur tree
  tree.root = Node("a");
  tree.root!.left = Node(1);
  tree.root!.left!.left = Node(3);
  tree.root!.left!.right = Node(4);
  tree.root!.right = Node(2);
  tree.root!.right!.left = Node(5);

  print("PreOrder traversal (non-rekursif):");
  tree.printPreOrder();

  print("\nInOrder traversal (non-rekursif):");
  tree.printInOrder();

  print("\nPostOrder traversal (non-rekursif):");
  tree.printPostOrder();
}
