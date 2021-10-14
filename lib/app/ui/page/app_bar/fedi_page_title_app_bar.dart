import 'package:fedi/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FediPageTitleAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final Widget leading;
  final bool centerTitle;
  final List<Widget>? actions;

  // AppBar size without bottom
  @override
  final preferredSize = calculatePreferredSize();

  static Size calculatePreferredSize() =>
      const Size.fromHeight(kToolbarHeight + 1);

  FediPageTitleAppBar({
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.leading = const FediBackIconButton(),
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
          centerTitle: centerTitle,
          actions: actions,
          // todo: refactor
          systemOverlayStyle: fediUiColorTheme.brightness == Brightness.light
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          backgroundColor: fediUiColorTheme.white,
          title: title != null ? FediSubHeaderText(title!) : null,
          leading: leading,
        ),
        const FediUltraLightGreyDivider(),
      ],
    );
  }
}
