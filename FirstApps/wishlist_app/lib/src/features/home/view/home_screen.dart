import 'package:flutter/material.dart';
import 'package:wishlist_app/src/config/constants/text_manager.dart';
import 'package:wishlist_app/src/network/data/app_constants.dart';
import 'package:wishlist_app/src/config/constants/value_manager.dart';
import 'package:wishlist_app/src/network/model/model.dart';
import 'package:wishlist_app/src/router/coordinator.dart';
import 'package:wishlist_app/widget/app_bar.dart';
import 'package:wishlist_app/widget/item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> listProducts;

  @override
  void initState() {
    super.initState();
    listProducts = RawData.allProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p8),
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(child: _buildListMusic(listProducts)),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return XAppBar(
      title: StringApp.homePage,
      leading: const Icon(
        Icons.home,
        size: SizeApp.s20,
      ),
      actions: [
        IconButton(
            onPressed: () => navigateFavoritePage(context),
            icon: const Icon(Icons.queue_music))
      ],
    );
  }

  void navigateFavoritePage(BuildContext context) async {
    listProducts = await AppCoordinator.showFavoriteScreen(listFavorited: listProducts) ??
        listProducts;
    setState(() {});
  }

  Widget _buildListMusic(List<Product> products) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: PaddingApp.p10),
        itemCount: products.length,
        itemBuilder: (context, index) => ItemCard(
            title: products[index].title,
            titleStyle: const TextStyle(
                fontSize: SizeApp.s20, fontWeight: FontWeight.w700),
            contentStyle: const TextStyle(
                fontSize: SizeApp.s15,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
            content: products[index].content,
            isFavorited: products[index].isFavorited,
            onChangedFavorite: (isFavor) =>
                _onChangeFavoriteCard(isFavorite: isFavor, index: index),
            leadingIcon: const Icon(
              Icons.music_note,
              color: Colors.greenAccent,
              size: SizeApp.s10,
            )));
  }

  void _onChangeFavoriteCard({required bool isFavorite, required int index}) {
    listProducts[index] = listProducts[index].copyWith(isFavorited: isFavorite);
  }
}
