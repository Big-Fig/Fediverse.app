import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_form_row_widget.dart';
import 'package:flutter/cupertino.dart';

class EditUiSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditUiSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const CurrentFediUiThemeChooserFormRowWidget(),
      ],
    );
  }
}
