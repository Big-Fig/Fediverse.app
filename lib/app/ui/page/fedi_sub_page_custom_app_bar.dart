import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediSubPageCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;
  final Widget leading;
  final bool centerTitle;

  // AppBar size without bottom
  @override
  final preferredSize = Size.fromHeight(kToolbarHeight);

  FediSubPageCustomAppBar({
    @required this.child,
    @required this.leading,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        leading: leading,
        centerTitle: centerTitle,
        titleSpacing: 0.0,
        backgroundColor: FediColors.white,
        title: child,
      );
}
