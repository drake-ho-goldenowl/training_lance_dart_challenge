import 'dart:convert';

import 'package:wishlist_app/src/network/model/model.dart';

class RawDataUtils {
  static String encodeData(List<Product> listFavor) {
    final List rawData = [];
    for (Product music in listFavor) {
      rawData.add(music.toJson());
    }
    return jsonEncode(rawData);
  }

  static List<Product> decodeData(String listFavorEncode) {
    final List rawListFavor = jsonDecode(listFavorEncode);
    final List<Product> listFavor = [];
    for (final data in rawListFavor) {
      listFavor.add(Product.fromJson(data));
    }
    return listFavor;
  }
}
