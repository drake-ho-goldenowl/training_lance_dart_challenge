import 'package:bloc/bloc.dart';
import 'package:wishlist_app/src/features/favorite/logic/favorite_state.dart';
import 'package:wishlist_app/src/network/model/model.dart';
import 'package:wishlist_app/src/router/coordinator.dart';

class FavoriteBloc extends Cubit<FavoriteState> {
  FavoriteBloc(List<Product> listProduct)
      : super(FavoriteState(listFavorited: listProduct));

  void removeFavoritedProduct({required int index}) {
    final listFavorProduct = state.listFavorited;
    listFavorProduct[index] =
        listFavorProduct[index].copyWith(isFavorited: false);
    emit(state.copyWith(listFavorited: listFavorProduct));
  }

  void clearFavoritedProducts() {
    final listFavorProduct = state.listFavorited;
    for (int i = 0; i < listFavorProduct.length; i++) {
      listFavorProduct[i] = listFavorProduct[i].copyWith(isFavorited: false);
    }
    emit(state.copyWith(listFavorited: listFavorProduct));
  }

  void navigationHomePage() {
    AppCoordinator.pop<List<Product>>(state.listFavorited);
  }
}
