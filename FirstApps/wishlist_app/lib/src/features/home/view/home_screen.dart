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
  late List<Product> rawData;

  @override
  void initState() {
    super.initState();
    rawData = RawData.allProducts;
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
            Expanded(child: _buildListMusic(rawData)),
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
    rawData = await AppCoordinator.showFavoriteScreen(listFavorited: rawData) ??
        rawData;
    setState(() {});
  }

  Widget _buildListMusic(List<Product> raw) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: PaddingApp.p10),
        itemCount: raw.length,
        itemBuilder: (context, index) => ItemCard(
            title: raw[index].title,
            titleStyle: const TextStyle(
                fontSize: SizeApp.s20, fontWeight: FontWeight.w700),
            contentStyle: const TextStyle(
                fontSize: SizeApp.s15,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
            content: raw[index].content,
            isFavorited: raw[index].isFavorited,
            onChangedFavorite: (isFavor) =>
                _onChangeFavoriteCard(isFavorite: isFavor, index: index),
            leadingIcon: const Icon(
              Icons.music_note,
              color: Colors.greenAccent,
              size: SizeApp.s10,
            )));
  }

  void _onChangeFavoriteCard({required bool isFavorite, required int index}) {
    rawData[index] = rawData[index].copyWith(isFavorited: isFavorite);
  }
}
