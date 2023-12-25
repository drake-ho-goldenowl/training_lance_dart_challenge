import 'package:flutter/material.dart';
import 'package:wishlist_app/src/config/constants/text_manager.dart';
import 'package:wishlist_app/src/network/data/app_constants.dart';
import 'package:wishlist_app/src/config/constants/value_manager.dart';
import 'package:wishlist_app/src/network/model/model.dart';
import 'package:wishlist_app/src/router/coordinator.dart';
import 'package:wishlist_app/widget/app_bar.dart';
import 'package:wishlist_app/widget/item_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({required this.listFavorited, super.key});
  final List<Product> listFavorited;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
        onPressed: () => _navigationHomePage(context, widget.listFavorited),
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

  void _navigationHomePage(BuildContext context, List<Product> listFavorited) {
    AppCoordinator.pop<List<Product>>(listFavorited);
  }

  Widget _renderClearAllButton(BuildContext context) {
    return IconButton(
        onPressed: () {}, icon: const Icon(Icons.cleaning_services_outlined));
  }

  Widget _buildListFavoriteMusic() {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: PaddingApp.p10),
        itemCount: widget.listFavorited.length,
        itemBuilder: (context, index) => widget.listFavorited[index].isFavorited
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
        deleteCallback: () => unfavoriteMusic(index: index),
        leadingIcon: const Icon(
          Icons.music_note,
          color: Colors.greenAccent,
          size: SizeApp.s10,
        ));
  }

  void unfavoriteMusic({required int index}) {
    widget.listFavorited[index] =
        widget.listFavorited[index].copyWith(isFavorited: false);
    setState(() {});
  }
}
