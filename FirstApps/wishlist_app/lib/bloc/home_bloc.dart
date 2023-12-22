import 'package:bloc/bloc.dart';
import 'package:wishlist_app/bloc/home_state.dart';
import 'package:wishlist_app/data/model.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(List<Product> listProduct)
      : super(HomeState(allProduct: listProduct));

  void changeFavoriteProduct(int index) {
    emit(state.copyWith(status: HomeStatus.finish));
    var listProduct = state.allProduct;
    listProduct[index].isFavorited = !listProduct[index].isFavorited;
    emit(state.copyWith(allProduct: listProduct, status: HomeStatus.reload));
  }

  void clearAllMusics() {
    emit(state.copyWith(status: HomeStatus.finish));
    var listProduct = state.allProduct;
    for (final music in listProduct) {
      music.isFavorited = false;
    }
    emit(state.copyWith(allProduct: listProduct, status: HomeStatus.reload));
  }
}
