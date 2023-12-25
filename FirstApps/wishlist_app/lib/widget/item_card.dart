import 'package:flutter/material.dart';
import 'package:wishlist_app/src/config/constants/value_manager.dart';

typedef VoidCallbackFunc = void Function();

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key,
      required this.title,
      this.titleStyle,
      required this.content,
      this.contentStyle,
      required this.leadingIcon,
      this.favoriteCallback,
      this.deleteCallback,
      this.isFavorited = false,
      this.isFromFavoritePage = false,
      this.onChangedFavorite});
  final String title;
  final TextStyle? titleStyle;
  final String content;
  final TextStyle? contentStyle;
  final Widget leadingIcon;
  final VoidCallbackFunc? favoriteCallback;
  final VoidCallbackFunc? deleteCallback;
  final bool isFavorited;
  final bool isFromFavoritePage;
  final void Function(bool)? onChangedFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: MarginApp.m6,
        horizontal: MarginApp.m8,
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: PaddingApp.p16, vertical: PaddingApp.p12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(RadiusApp.r8),
          boxShadow: const [
            BoxShadow(offset: Offset(2, 2), spreadRadius: 2.0, blurRadius: 3.0)
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_renderHeaderCard(), _renderBodyCard()],
      ),
    );
  }

  Widget _renderHeaderCard() {
    return Row(
      children: [
        leadingIcon,
        const SizedBox(
          width: PaddingApp.p8,
        ),
        Expanded(
            child: Text(
          title,
          style: titleStyle,
        )),
        isFromFavoritePage
            ? IconButton(
                onPressed: deleteCallback,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                  size: SizeApp.s20,
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _renderBodyCard() {
    return Row(
      children: [
        Expanded(
            child: Text(
          content,
          style: contentStyle,
        )),
        isFromFavoritePage
            ? const SizedBox.shrink()
            : Center(
                child: IconButton(
                  onPressed: () {
                    onChangedFavorite?.call(!isFavorited);
                  },
                  icon: Icon(
                    isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                    size: SizeApp.s20,
                  ),
                ),
              )
      ],
    );
  }
}
