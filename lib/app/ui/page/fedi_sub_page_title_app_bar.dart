import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediSubPageTitleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final Widget leading;
  final bool centerTitle;
  final List<Widget> actions;

  // AppBar size without bottom
  @override
  final preferredSize = Size.fromHeight(kToolbarHeight);

  FediSubPageTitleAppBar({
    this.title,
    this.actions,
    this.centerTitle = true,
    this.leading = const FediBackIconButton(),
  });

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: centerTitle,
        actions: actions,
        brightness: Brightness.light,
        backgroundColor: FediColors.white,
        title: title != null ? FediSubHeaderText(title) : null,
        leading: leading,
      );
}
