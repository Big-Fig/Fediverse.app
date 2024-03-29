import 'package:fedi_app/app/ui/button/icon/fedi_back_icon_button.dart';
import 'package:fedi_app/app/ui/divider/fedi_ultra_light_grey_divider.dart';
import 'package:fedi_app/app/ui/header/fedi_sub_header_text.dart';
import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
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
    Key? key,
    required this.title,
    this.actions,
    this.centerTitle = true,
    this.leading = const FediBackIconButton(),
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
          centerTitle: centerTitle,
          actions: actions,
          // todo: refactor
          systemOverlayStyle: fediUiColorTheme.brightness == Brightness.light
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark,
          backgroundColor: fediUiColorTheme.white,
          title: title != null ? FediSubHeaderText(text: title!) : null,
          leading: leading,
        ),
        const FediUltraLightGreyDivider(),
      ],
    );
  }
}
