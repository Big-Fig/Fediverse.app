import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditMediaSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditMediaSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editMediaSettingsBloc = IEditMediaSettingsBloc.of(context);
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        FormBoolFieldFormRowWidget(
          label: S.of(context).app_media_settings_field_autoInit_label,
          field: editMediaSettingsBloc.autoInitFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: S.of(context).app_media_settings_field_autoPlay_label,
          field: editMediaSettingsBloc.autoPlayFieldBloc,
        ),
      ],
    );
  }
}
