import 'package:flutter/material.dart';

class Category implements Comparable<Category> {
  final String name;

  Category({@required this.name});


  @override
  int compareTo(Category other) {
    return name.compareTo(other.name);
  }

  @override
  String toString() {
    return 'Category{name: $name}';
  }
}