import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FediPageCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;
  final Widget leading;
  final bool centerTitle;
  final List<Widget> actions;

  // AppBar size without bottom
  @override
  final preferredSize = calculatePreferredSize();

  static Size calculatePreferredSize() => Size.fromHeight(kToolbarHeight + 1);

  FediPageCustomAppBar({
    @required this.child,
    @required this.leading,
    this.centerTitle = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    var fediUiColorTheme = IFediUiColorTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: leading,
          centerTitle: centerTitle,
          titleSpacing: 0.0,
          brightness: fediUiColorTheme.brightness,
          backgroundColor: fediUiColorTheme.white,
          title: child,
          actions: actions,
        ),
        const FediUltraLightGreyDivider(),
      ],
    );
  }
}
