import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FediPageCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget child;
  final Widget leading;
  final bool centerTitle;
  final List<Widget>? actions;

  // AppBar size without bottom
  @override
  Size get preferredSize => calculatePreferredSize();

  static Size calculatePreferredSize() =>
      const Size.fromHeight(kToolbarHeight + 1);

  const FediPageCustomAppBar({
    Key? key,
    required this.child,
    required this.leading,
    this.centerTitle = false,
    this.actions,
  }) : super(key: key);

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
          // todo: refactor
          systemOverlayStyle: fediUiColorTheme.brightness == Brightness.light
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          backgroundColor: fediUiColorTheme.white,
          title: child,
          actions: actions,
        ),
        const FediUltraLightGreyDivider(),
      ],
    );
  }
}
