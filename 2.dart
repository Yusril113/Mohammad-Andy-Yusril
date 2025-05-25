  import 'dart:io';

  class Node<T> {
    T nodeValue;
    Node? left, right;

    Node(this.nodeValue);
  }

  class BinaryTree {
    Node? root;

    // travesal Pre - Order
    void printPreorder(Node? node) {
      if (node != null) {
        stdout.write('${node.nodeValue} ');
        printPreorder(node.left);
        printPreorder(node.right);
      }
    }

    void printInOrder(Node? node) {
      if (node != null) {
        printInOrder(node.left);
        printInOrder(node.right);
        stdout.write('${node.nodeValue} ');
      }
    }

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

    print("PreOrder traversal of binary tree is: ");
    Btree.printPreorder(Btree.root);

    print("\nInorder traversal of binary tree is: ");
    Btree.printInOrder(Btree.root);
  
    print("\nPostoder traversal of binary tree is: ");
    Btree.printPostoder(Btree.root);

  }
