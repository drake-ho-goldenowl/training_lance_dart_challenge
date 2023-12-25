import 'package:wishlist_app/src/network/model/model.dart';

enum HomeStatus { init, reload, finish }

class HomeState {
  final List<Product> allProduct;
  final HomeStatus status;

  const HomeState({required this.allProduct, this.status = HomeStatus.init});

  HomeState copyWith({
    List<Product>? allProduct,
    HomeStatus? status,
  }) {
    return HomeState(
        allProduct: allProduct ?? this.allProduct,
        status: status ?? this.status);
  }
}
