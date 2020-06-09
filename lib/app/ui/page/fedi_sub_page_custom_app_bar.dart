import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/status_bar/fedi_dark_status_bar_style_area.dart';
import 'package:fedi/app/ui/status_bar/fedi_light_status_bar_style_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediSubPageCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;
  final Widget leading;

  // AppBar size without bottom
  @override
  final preferredSize = Size.fromHeight(kToolbarHeight);

  FediSubPageCustomAppBar({
    @required this.child,
    @required this.leading,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        leading: leading,
        centerTitle: false,
        titleSpacing: 0.0,
//          brightness: Brightness.light,
        backgroundColor: FediColors.white,
        title: child,
      );
}
