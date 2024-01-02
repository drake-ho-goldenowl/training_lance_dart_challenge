import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/link_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: _renderSliverAppBar(),
              stretchModes: const [StretchMode.zoomBackground],
              title: _renderInformationTitle(),
            ),
            pinned: true,
            expandedHeight: 200,
            stretch: true,
            elevation: 0,
            centerTitle: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => ListTile(
                title: Text("Information: $index"),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderSliverAppBar() {
    return Image.network(
      AppLinkManager.luffyLinkImage,
      fit: BoxFit.cover,
    );
  }

  Widget _renderInformationTitle() {
    return Text(
      "Monkey D. Luffy",
      style: TextStyle(
          color: Colors.white,
          letterSpacing: 2,
          backgroundColor: Colors.black.withOpacity(0.5),
          fontSize: AppFontSize.f20,
          fontWeight: FontWeight.w700),
    );
  }
}
