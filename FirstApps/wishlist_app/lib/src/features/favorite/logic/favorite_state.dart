import 'package:wishlist_app/src/network/model/model.dart';

class FavoriteState {
  final List<Product> listFavorited;

  const FavoriteState({required this.listFavorited});

  FavoriteState copyWith({
    List<Product>? listFavorited,
  }) {
    return FavoriteState(
      listFavorited: listFavorited ?? this.listFavorited,
    );
  }
}
