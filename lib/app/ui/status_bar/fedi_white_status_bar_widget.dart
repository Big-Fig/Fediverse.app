import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/ui/status_bar/filled_status_bar_widget.dart';
import 'package:flutter/cupertino.dart';

class FediWhiteStatusBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FilledStatusBarWidget(
        color: IFediUiColorTheme.of(context).white,
      );
  const FediWhiteStatusBarWidget();
}
