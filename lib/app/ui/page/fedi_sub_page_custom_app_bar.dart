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
  final preferredSize = Size.fromHeight(kToolbarHeight);

  FediSubPageCustomAppBar({
    @required this.child,
    @required this.leading,
    this.centerTitle = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        leading: leading,
        centerTitle: centerTitle,
        titleSpacing: 0.0,
        backgroundColor: IFediUiColorTheme.of(context).white,
        title: child,
        actions: actions,
      );
}
