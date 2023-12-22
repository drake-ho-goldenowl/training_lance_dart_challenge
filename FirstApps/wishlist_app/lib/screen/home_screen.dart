import 'package:flutter/material.dart';
import 'package:wishlist_app/data/app_constants.dart';
import 'package:wishlist_app/data/model.dart';
import 'package:wishlist_app/src/text_manager.dart';
import 'package:wishlist_app/src/value_manager.dart';
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

  void navigateFavoritePage(BuildContext context) {}

  Widget _buildListMusic() {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: PaddingApp.p10),
        itemCount: rawData.length,
        itemBuilder: (context, index) => ItemCard(
            title: rawData[index].title,
            titleStyle: const TextStyle(
                fontSize: SizeApp.s20, fontWeight: FontWeight.w700),
            contentStyle: const TextStyle(
                fontSize: SizeApp.s15,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
            content: rawData[index].content,
            isFavorited: rawData[index].isFavorited,
            leadingIcon: const Icon(
              Icons.music_note,
              color: Colors.greenAccent,
              size: SizeApp.s10,
            )));
  }
}
