import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const CustomAppBar({Key key, this.actions}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.light,
      elevation: 0,
      leading: IconButton(
        icon: Hero(
            tag: "app_bar_menu_icon",
            child: SvgPicture.asset('assets/icons/menu.svg')),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: actions,
      centerTitle: true,
    );
  }
}
