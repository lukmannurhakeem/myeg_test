import 'package:flutter/material.dart';
import 'package:myeg_test/extensions/text_style_extension.dart';
import 'package:myeg_test/theme/color_theme.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? leading;
  final Color backgroundColor;
  final double elevation;

  const CommonAppBar({
    Key? key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.leading,
    this.backgroundColor = AppColorTheme.primaryLight,
    this.elevation = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: context.titleL,
      ),
      centerTitle: centerTitle,
      actions: actions,
      leading: leading,
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
