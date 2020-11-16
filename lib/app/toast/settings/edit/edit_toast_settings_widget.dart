import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class EditToastSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditToastSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        FormBoolFieldFormRowWidget(
          label: S.of(context).app_toast_settings_field_notificationForMention_label,
          field: editToastSettingsBloc.notificationForMentionFieldBloc,
        ),
        FormBoolFieldFormRowWidget(
          label: S.of(context).app_toast_settings_field_notificationForChatAndDm_label,
          field: editToastSettingsBloc.notificationForChatAndDmFieldBloc,
        ),
      ],
    );
  }
}
