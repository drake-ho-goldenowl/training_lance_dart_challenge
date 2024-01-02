import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/link_manager.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
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
            ),
            pinned: true,
            expandedHeight: 200,
            stretch: true,
            elevation: 0,
            title: const Text(AppString.imageView),
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
    return Stack(
      fit: StackFit.expand,
      children: [
        _renderImage(),
        _renderInformationTitle(),
      ],
    );
  }

  Widget _renderImage() {
    return Image.network(
      AppLinkManager.luffyLinkImage,
      fit: BoxFit.cover,
    );
  }

  Widget _renderInformationTitle() {
    return Positioned(
      left: AppPadding.p10,
      bottom: AppPadding.p0,
      child: Opacity(
        opacity: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Monkey D. Luffy",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  fontSize: AppFontSize.f20,
                  fontWeight: FontWeight.w700),
            ),
            _renderInforChip(),
          ],
        ),
      ),
    );
  }

  Widget _renderInforChip() {
    return Row(
      children: [
        Chip(
          label: const Text('Tu Hoang'),
          backgroundColor: Colors.grey[350],
        ),
        const SizedBox(width: AppPadding.p16),
        Chip(
          label: const Text('Than Mat Troi NiKa'),
          backgroundColor: Colors.grey[350],
        ),
      ],
    );
  }
}
