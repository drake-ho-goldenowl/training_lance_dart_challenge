import 'package:wishlist_app/modules/home_page/models/product_model.dart';

enum HomeStatus { init, reload, finish }

class HomeState {
  final List<Product> allProduct;
  final HomeStatus status;

  HomeState({required this.allProduct, this.status = HomeStatus.init});

  HomeState copyWith({
    List<Product>? allProduct,
    HomeStatus? status,
  }) {
    return HomeState(
        allProduct: allProduct ?? this.allProduct,
        status: status ?? this.status);
  }
}
