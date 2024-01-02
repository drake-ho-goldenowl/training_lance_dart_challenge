enum AppRouteNames {
  dashboard(path: '/'),
  cupertino(path: "/cupertino"),
  richText(path: "/richText"),
  rowColumn(path: "/rowColumn"),
  wrapChip(path: "/wrapChip"),
  stackAlign(path: "/stackAlign"),
  customBoxShape(path: "/customBoxShape"),
  bottomAppBar(path: "/bottomAppBar"),
  button(path: "/button"),
  textField(path: "/textField"),
  image(path: "/image"),
  container(path: "/container");

  const AppRouteNames({
    required this.path,
  });

  final String path;

  String get name => path;

  String get subPath {
    if (path == '/') {
      return path;
    }
    return path.replaceFirst('/', '');
  }
}
