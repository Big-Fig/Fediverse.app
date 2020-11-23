import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditToastSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditToastSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const _EditToastSettingsNotificationForMentionWidget(),
        const _EditToastSettingsNotificationForChatAndDmWidget(),
      ],
    );
  }
}

class _EditToastSettingsNotificationForChatAndDmWidget extends StatelessWidget {
  const _EditToastSettingsNotificationForChatAndDmWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) =>
          value.notificationForChatAndDmFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S
            .of(context)
            .app_toast_settings_field_notificationForChatAndDm_label,
      ),
    );
  }
}

class _EditToastSettingsNotificationForMentionWidget extends StatelessWidget {
  const _EditToastSettingsNotificationForMentionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) =>
          value.notificationForMentionFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label:
            S.of(context).app_toast_settings_field_notificationForMention_label,
      ),
    );
  }
}
