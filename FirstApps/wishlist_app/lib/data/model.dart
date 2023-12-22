import 'package:flutter/material.dart';

class Product {
  final String title;
  final String content;
  bool isFavorited;
  final IconData icon;

  Product(
      {required this.title,
      required this.content,
      required this.icon,
      this.isFavorited = false});
}
