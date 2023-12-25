import 'package:flutter/material.dart';
import 'package:wishlist_app/src/config/constants/text_manager.dart';
import 'package:wishlist_app/src/network/model/model.dart';

class RawData {
  static List<Product> allProducts = [
    Product(
        title: StringApp.title1,
        content: StringApp.content1,
        isFavorited: false,
        icon: Icons.music_note),
    Product(
        title: StringApp.title2,
        content: StringApp.content2,
        isFavorited: false,
        icon: Icons.music_note),
    Product(
        title: StringApp.title3,
        content: StringApp.content3,
        isFavorited: false,
        icon: Icons.music_note),
    Product(
        title: StringApp.title4,
        content: StringApp.content4,
        isFavorited: false,
        icon: Icons.music_note),
    Product(
        title: StringApp.title5,
        content: StringApp.content5,
        isFavorited: false,
        icon: Icons.music_note),
    Product(
        title: StringApp.title6,
        content: StringApp.content6,
        isFavorited: false,
        icon: Icons.music_note),
    Product(
        title: StringApp.title7,
        content: StringApp.content7,
        isFavorited: false,
        icon: Icons.music_note),
  ];
}
