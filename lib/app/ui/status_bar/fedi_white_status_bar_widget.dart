import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/ui/status_bar/filled_status_bar_widget.dart';
import 'package:flutter/cupertino.dart';

class FediWhiteStatusBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FilledStatusBarWidget(
        color: FediColors.white,
      );
  const FediWhiteStatusBarWidget();
}
