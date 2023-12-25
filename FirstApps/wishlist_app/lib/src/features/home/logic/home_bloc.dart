import 'package:bloc/bloc.dart';
import 'package:wishlist_app/src/features/home/logic/home_state.dart';
import 'package:wishlist_app/src/network/model/model.dart';
import 'package:wishlist_app/src/router/coordinator.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(List<Product> listProduct)
      : super(HomeState(allProduct: listProduct));

  void changeFavoriteProduct({required int index, bool isFavor = false}) {
    final copyState = state.copyWith();
    copyState.allProduct[index] =
        copyState.allProduct[index].copyWith(isFavorited: isFavor);
    emit(copyState);
  }

  void navigateFavoritePage() async {
    final listProducts = await AppCoordinator.showFavoriteScreen(
        listFavorited: state.allProduct);
    emit(state.copyWith(allProduct: listProducts));
  }
}
