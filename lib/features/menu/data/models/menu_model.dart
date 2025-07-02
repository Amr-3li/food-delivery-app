class MenuGroup {
  final String? groupTitle;
  final List<MenuItem> items;

  MenuGroup({this.groupTitle, required this.items});
}

class MenuItem {
  final String icon;
  final String title;
  final String? route;
  final bool isLogout;

  MenuItem({
    required this.icon,
    required this.title,
    this.route,
    this.isLogout = false,
  });
}