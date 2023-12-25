import 'package:flutter/material.dart';
import 'package:wishlist_app/src/config/constants/text_manager.dart';
import 'package:wishlist_app/src/features/home/logic/home_bloc.dart';
import 'package:wishlist_app/src/features/home/logic/home_state.dart';
import 'package:wishlist_app/src/config/constants/value_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_app/widget/app_bar.dart';
import 'package:wishlist_app/widget/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            Expanded(child: _buildListMusic()),
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
            onPressed: () => context.read<HomeBloc>().navigateFavoritePage(),
            icon: const Icon(Icons.queue_music))
      ],
    );
  }

  Widget _buildListMusic() {
    return BlocBuilder<HomeBloc, HomeState>(
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
                onChangedFavorite: (isFavor) => context
                    .read<HomeBloc>()
                    .changeFavoriteProduct(index: index, isFavor: isFavor),
                leadingIcon: const Icon(
                  Icons.music_note,
                  color: Colors.greenAccent,
                  size: SizeApp.s10,
                )));
      },
    );
  }
}
