import 'package:fedi/app/localization/form_localization_current_locale_field_form_row_widget.dart';
import 'package:fedi/app/localization/settings/edit/edit_localization_settings_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditLocalizationSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditLocalizationSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editLocalizationSettingsBloc =
        IEditLocalizationSettingsBloc.of(context);
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        FormLocalizationCurrentLocaleFieldFormRowWidget(
          label: S
              .of(context)
              .app_localization_settings_field_localizationLocale_label,
          field: editLocalizationSettingsBloc.localizationLocaleFieldBloc,
        ),
      ],
    );
  }
}
