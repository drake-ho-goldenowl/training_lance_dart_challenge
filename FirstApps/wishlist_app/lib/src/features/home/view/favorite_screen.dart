import 'package:flutter/material.dart';
import 'package:wishlist_app/src/config/constants/text_manager.dart';
import 'package:wishlist_app/src/network/data/app_constants.dart';
import 'package:wishlist_app/src/config/constants/value_manager.dart';
import 'package:wishlist_app/widget/app_bar.dart';
import 'package:wishlist_app/widget/item_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
            Expanded(child: _buildListFavoriteMusic()),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return XAppBar(
      title: StringApp.favoritePage,
      leading: IconButton(
        onPressed: () => _navigationHomePage(context),
        icon: const Icon(
          Icons.arrow_back,
          size: SizeApp.s20,
        ),
      ),
      actions: [
        _renderClearAllButton(context),
      ],
    );
  }

  void _navigationHomePage(BuildContext context) {}

  Widget _renderClearAllButton(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: const Icon(Icons.cleaning_services_outlined));
  }

  Widget _buildListFavoriteMusic() {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: PaddingApp.p10),
        itemCount: RawData.allProducts.length,
        itemBuilder: (context, index) => RawData.allProducts[index].isFavorited
            ? _renderMusicCard(context, index: index)
            : const SizedBox.shrink());
  }

  Widget _renderMusicCard(BuildContext context, {required int index}) {
    return ItemCard(
        title: RawData.allProducts[index].title,
        titleStyle:
            const TextStyle(fontSize: SizeApp.s20, fontWeight: FontWeight.w700),
        contentStyle: const TextStyle(
            fontSize: SizeApp.s15,
            fontWeight: FontWeight.w400,
            color: Colors.black54),
        content: RawData.allProducts[index].content,
        isFromFavoritePage: true,
        leadingIcon: const Icon(
          Icons.music_note,
          color: Colors.greenAccent,
          size: SizeApp.s10,
        ));
  }
}
