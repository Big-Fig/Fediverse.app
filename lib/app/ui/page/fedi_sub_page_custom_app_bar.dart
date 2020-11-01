import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediSubPageCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;
  final Widget leading;
  final bool centerTitle;
  final List<Widget> actions;

  // AppBar size without bottom
  @override
  final preferredSize = calculatePreferredSize();

  static Size calculatePreferredSize() => Size.fromHeight(kToolbarHeight);

  FediSubPageCustomAppBar({
    @required this.child,
    @required this.leading,
    this.centerTitle = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return AppBar(
      leading: leading,
      centerTitle: centerTitle,
      titleSpacing: 0.0,
      brightness: fediUiColorTheme.brightness,
      backgroundColor: fediUiColorTheme.white,
      title: child,
      actions: actions,
    );
  }
}
