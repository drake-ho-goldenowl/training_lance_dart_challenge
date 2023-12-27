enum AppRouteNames {
  dashboard(path: '/'),
  cupertino(path: "/cupertino"),
  richText(path: "/richText"),
  rowColumn(path: "/rowColumn"),
  stackAlign(path: "/stackAlign"),
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
