import 'package:flutter/material.dart';
import 'package:gallery_app/src/config/constant/link_manager.dart';
import 'package:gallery_app/src/config/constant/text_manager.dart';
import 'package:gallery_app/src/config/constant/value_manager.dart';
import 'package:gallery_app/src/router/coordinator.dart';

class ImageView extends StatelessWidget {
  const ImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: XSliverAppBar(
                  title: AppString.imageView, expandedHeight: 200),
              pinned: true,
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
      ),
    );
  }
}

class XSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String title;

  XSliverAppBar({required this.title, required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _renderImage(),
        _renderAppBar(shrinkOffset),
        _renderInformationTitle(shrinkOffset),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  Widget _renderImage() {
    return Image.network(
      AppLinkManager.luffyLinkImage,
      fit: BoxFit.cover,
    );
  }

  Widget _renderAppBar(double shrinkOffset) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Opacity(
        opacity: shrinkOffset / expandedHeight,
        child: Container(
          color: Colors.blue[100],
          child: Row(
            children: [
              IconButton(
                  onPressed: () => AppCoordinator.showDashboardScreen(),
                  icon: const Icon(Icons.arrow_back)),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 23,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderInformationTitle(double shrinkOffset) {
    return Positioned(
      left: AppPadding.p10,
      bottom: AppPadding.p0,
      child: Opacity(
        opacity: (1 - shrinkOffset / expandedHeight),
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
