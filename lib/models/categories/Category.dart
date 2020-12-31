import 'package:flutter/material.dart';

class Category {
  final String name;

  Category({@required this.name});

  @override
  String toString() {
    return 'Category{name: $name}';
  }
}