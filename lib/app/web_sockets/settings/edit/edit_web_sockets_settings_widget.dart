import 'package:fedi/app/form/form_web_sockets_settings_type_field_form_row_widget.dart';
import 'package:fedi/app/web_sockets/settings/edit/edit_web_sockets_settings_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditWebSocketsSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditWebSocketsSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editWebSocketsSettingsBloc = IEditWebSocketsSettingsBloc.of(context);
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        FormWebSocketsSettingsTypeFieldFormRowWidget(
          label: S.of(context).app_web_sockets_settings_field_type_label,
          description:
              S.of(context).app_web_sockets_settings_field_type_description,
          field: editWebSocketsSettingsBloc.typeFieldBloc,
          enabled: editWebSocketsSettingsBloc.enabled,
        ),
      ],
    );
  }
}
