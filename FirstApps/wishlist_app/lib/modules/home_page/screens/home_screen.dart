import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_app/modules/home_page/bloc/home_bloc.dart';
import 'package:wishlist_app/modules/home_page/bloc/home_state.dart';
import 'package:wishlist_app/modules/home_page/screens/favorite_screen.dart';
import 'package:wishlist_app/constants/text_constants.dart';
import 'package:wishlist_app/constants/value_constants.dart';
import 'package:wishlist_app/widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: PaddingApp.p8),
        child: _buildListMusic(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(StringApp.homePage),
      centerTitle: true,
      titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: SizeApp.s20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
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

  void navigateFavoritePage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => BlocProvider.value(
                  value: BlocProvider.of<HomeBloc>(context),
                  child: const FavoriteScreen(),
                )));
  }

  Widget _buildListMusic() {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (pre, cur) => pre.status != cur.status,
      builder: (context, state) {
        return ListView.builder(
            padding: const EdgeInsets.only(bottom: PaddingApp.p10),
            itemCount: state.allProduct.length,
            itemBuilder: (context, index) => ItemCard(
                title: state.allProduct[index].title,
                titleStyle: const TextStyle(
                    fontSize: SizeApp.s20, fontWeight: FontWeight.w700),
                contentStyle: const TextStyle(
                    fontSize: SizeApp.s15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
                content: state.allProduct[index].content,
                isFavorited: state.allProduct[index].isFavorited,
                favoriteCallback: () =>
                    context.read<HomeBloc>().changeFavoriteProduct(index),
                leadingIcon: const Icon(
                  Icons.music_note,
                  color: Colors.greenAccent,
                  size: SizeApp.s10,
                )));
      },
    );
  }
}
