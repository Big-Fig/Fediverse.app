import 'package:fedi_app/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi_app/ui/status_bar/filled_status_bar_widget.dart';
import 'package:flutter/cupertino.dart';

class FediWhiteStatusBarWidget extends StatelessWidget {
  const FediWhiteStatusBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FilledStatusBarWidget(
        color: IFediUiColorTheme.of(context).white,
      );
}
