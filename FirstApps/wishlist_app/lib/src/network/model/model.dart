import 'package:flutter/material.dart';

class Product {
  final String title;
  final String content;
  final bool isFavorited;
  final IconData icon;

  Product(
      {required this.title,
      required this.content,
      required this.isFavorited,
      required this.icon});

  Product copyWith(
      {String? title, String? content, bool? isFavorited, IconData? icon}) {
    return Product(
        title: title ?? this.title,
        content: content ?? this.content,
        isFavorited: isFavorited ?? this.isFavorited,
        icon: icon ?? this.icon);
  }
}
