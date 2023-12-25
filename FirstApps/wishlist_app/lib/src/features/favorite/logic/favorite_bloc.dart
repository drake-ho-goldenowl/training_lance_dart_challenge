import 'package:bloc/bloc.dart';
import 'package:wishlist_app/src/features/favorite/logic/favorite_state.dart';
import 'package:wishlist_app/src/network/model/model.dart';
import 'package:wishlist_app/src/router/coordinator.dart';

class FavoriteBloc extends Cubit<FavoriteState> {
  FavoriteBloc(List<Product> listProduct)
      : super(FavoriteState(listFavorited: listProduct));

  void navigationHomePage() {
    AppCoordinator.pop<List<Product>>(state.listFavorited);
  }
}
