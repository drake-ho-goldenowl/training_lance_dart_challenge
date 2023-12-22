import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_app/modules/home_page/bloc/home_bloc.dart';
import 'package:wishlist_app/modules/home_page/bloc/home_state.dart';
import 'package:wishlist_app/constants/text_constants.dart';
import 'package:wishlist_app/constants/value_constants.dart';
import 'package:wishlist_app/widgets/item_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p8),
        child: _buildListFavoriteMusic(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(StringApp.favoritePage),
      centerTitle: true,
      titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: SizeApp.s20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
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

  void _navigationHomePage(BuildContext context) {
    Navigator.pop(context);
  }

  Widget _renderClearAllButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<HomeBloc>().clearAllMusics();
        },
        icon: const Icon(Icons.cleaning_services_outlined));
  }

  Widget _buildListFavoriteMusic() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (pre, cur) => pre.status != cur.status,
      builder: (context, state) {
        return ListView.builder(
            padding: const EdgeInsets.only(bottom: PaddingApp.p10),
            itemCount: state.allProduct.length,
            itemBuilder: (context, index) => state.allProduct[index].isFavorited
                ? _renderMusicCard(context, state: state, index: index)
                : const SizedBox.shrink());
      },
    );
  }

  Widget _renderMusicCard(BuildContext context,
      {required HomeState state, required int index}) {
    return ItemCard(
        title: state.allProduct[index].title,
        titleStyle:
            const TextStyle(fontSize: SizeApp.s20, fontWeight: FontWeight.w700),
        contentStyle: const TextStyle(
            fontSize: SizeApp.s15,
            fontWeight: FontWeight.w400,
            color: Colors.black54),
        content: state.allProduct[index].content,
        isFromFavoritePage: true,
        deleteCallback: () =>
            context.read<HomeBloc>().changeFavoriteProduct(index),
        leadingIcon: const Icon(
          Icons.music_note,
          color: Colors.greenAccent,
          size: SizeApp.s10,
        ));
  }
}
