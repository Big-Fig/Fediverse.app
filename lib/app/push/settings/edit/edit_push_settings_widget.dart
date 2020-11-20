import 'dart:async';

import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPushSettingsWidget extends StatefulWidget {
  final bool shrinkWrap;

  const EditPushSettingsWidget({@required this.shrinkWrap});

  @override
  _EditPushSettingsWidgetState createState() => _EditPushSettingsWidgetState();
}

class _EditPushSettingsWidgetState extends State<EditPushSettingsWidget> {
  StreamSubscription failedToUpdateSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var settingsBloc = IPushSettingsBloc.of(context, listen: false);

    failedToUpdateSubscription =
        settingsBloc.failedToUpdateStream.listen((error) {
      IToastService.of(context, listen: false).showErrorToast(
        context: context,
        title: S.of(context).app_push_settings_update_fail_dialog_title,
        content: error?.toString(),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();

    failedToUpdateSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    var editPushSettingsBloc = IEditPushSettingsBloc.of(context);

    return StreamBuilder<bool>(
        stream: editPushSettingsBloc.enabledStream,
        initialData: editPushSettingsBloc.enabled,
        builder: (context, snapshot) {
          var enabled = snapshot.data;
          return Column(
            mainAxisSize:
                widget.shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
            children: [
              Text(
                S.of(context).app_push_settings_desc,
                style: IFediUiTextTheme.of(context).smallShortBoldLightGrey,
              ),
              FormBoolFieldFormRowWidget(
                label: S.of(context).app_push_settings_field_favourites_label,
                field: editPushSettingsBloc.favouriteFieldBloc,
                enabled: enabled,
              ),
              FormBoolFieldFormRowWidget(
                label: S.of(context).app_push_settings_field_follows_label,
                field: editPushSettingsBloc.followFieldBloc,
                enabled: enabled,
              ),
              FormBoolFieldFormRowWidget(
                label: S.of(context).app_push_settings_field_mentions_label,
                field: editPushSettingsBloc.mentionFieldBloc,
                enabled: enabled,
              ),
              FormBoolFieldFormRowWidget(
                label: S.of(context).app_push_settings_field_reblogs_label,
                field: editPushSettingsBloc.reblogFieldBloc,
                enabled: enabled,
              ),
              FormBoolFieldFormRowWidget(
                label: S.of(context).app_push_settings_field_polls_label,
                field: editPushSettingsBloc.pollFieldBloc,
                enabled: enabled,
              ),
              FormBoolFieldFormRowWidget(
                label: S.of(context).app_push_settings_field_pleroma_chat_label,
                field: editPushSettingsBloc.pleromaChatMentionFieldBloc,
                enabled: enabled,
              ),
              FormBoolFieldFormRowWidget(
                label: S
                    .of(context)
                    .app_push_settings_field_pleroma_emojiReaction_label,
                field: editPushSettingsBloc.pleromaEmojiReactionFieldBloc,
                enabled: enabled,
              ),
            ],
          );
        });
  }
}
