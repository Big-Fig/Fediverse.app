import 'package:fedi/app/ui/settings/edit/edit_ui_settings_bloc.dart';
import 'package:fedi/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_row_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
        ProxyProvider<IEditUiSettingsBloc,
            IFediUiThemeSingleFromListValueFormFieldBloc>(
          update: (context, value, previous) => value.fediThemeFieldBloc,
          child: const FediUiThemeSingleFromListValueFormFieldRowWidget(),
        ),
      ],
    );
  }
}
