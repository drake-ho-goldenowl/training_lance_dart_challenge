import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_app/src/config/constants/text_manager.dart';
import 'package:wishlist_app/src/features/favorite/logic/favorite_bloc.dart';
import 'package:wishlist_app/src/features/favorite/logic/favorite_state.dart';
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
        onPressed: () => context.read<FavoriteBloc>().navigationHomePage(),
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

  Widget _renderClearAllButton(BuildContext context) {
    return IconButton(
        onPressed: () => context.read<FavoriteBloc>().clearFavoritedProducts(),
        icon: const Icon(Icons.cleaning_services_outlined));
  }

  Widget _buildListFavoriteMusic() {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        return ListView.builder(
            padding: const EdgeInsets.only(bottom: PaddingApp.p10),
            itemCount: state.listFavorited.length,
            itemBuilder: (context, index) =>
                state.listFavorited[index].isFavorited
                    ? _renderMusicCard(context, index: index)
                    : const SizedBox.shrink());
      },
    );
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
        deleteCallback: () =>
            context.read<FavoriteBloc>().removeFavoritedProduct(index: index),
        isFromFavoritePage: true,
        leadingIcon: const Icon(
          Icons.music_note,
          color: Colors.greenAccent,
          size: SizeApp.s10,
        ));
  }
}
