import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'model.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final String title;
  final String content;
  final bool isFavorited;

  const Product(
      {required this.title, required this.content, required this.isFavorited});

  @override
  String toString() {
    return 'Product{title=$title, content=$content, isFavorited=$isFavorited}';
  }

  @override
  List<Object?> get props => [isFavorited];

  Product copyWith(
      {String? title, String? content, bool? isFavorited, IconData? icon}) {
    return Product(
      title: title ?? this.title,
      content: content ?? this.content,
      isFavorited: isFavorited ?? this.isFavorited,
    );
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
