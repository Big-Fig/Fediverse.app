import 'dart:async';

import 'package:fedi/app/form/form_bool_field_form_row_widget.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PushSettingsWidget extends StatefulWidget {
  @override
  _PushSettingsWidgetState createState() => _PushSettingsWidgetState();

  const PushSettingsWidget();
}

class _PushSettingsWidgetState extends State<PushSettingsWidget> {
  StreamSubscription failedToUpdateSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var settingsBloc = IPushSettingsBloc.of(context, listen: false);

    failedToUpdateSubscription = settingsBloc.failedToUpdateStream.listen((error) {
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
    var settingsBloc = IEditPushSettingsBloc.of(context);

    return ListView(
      children: [
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_push_settings_field_favourites_label,
          field: settingsBloc.favouriteFieldBloc,
          enabled: settingsBloc.enabled,
        ),
        FormBoolFieldFormRowWidget(
          label:
              S.of(context).app_push_settings_field_follows_label,
          field: settingsBloc.followFieldBloc,
          enabled: settingsBloc.enabled,
        ),
        FormBoolFieldFormRowWidget(
          label:
              S.of(context).app_push_settings_field_mentions_label,
          field: settingsBloc.mentionFieldBloc,
          enabled: settingsBloc.enabled,
        ),
        FormBoolFieldFormRowWidget(
          label:
              S.of(context).app_push_settings_field_reblogs_label,
          field: settingsBloc.reblogFieldBloc,
          enabled: settingsBloc.enabled,
        ),
        FormBoolFieldFormRowWidget(
          label: S.of(context).app_push_settings_field_polls_label,
          field: settingsBloc.pollFieldBloc,
          enabled: settingsBloc.enabled,
        ),
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_push_settings_field_pleroma_chat_label,
          field: settingsBloc.pleromaChatMentionFieldBloc,
          enabled: settingsBloc.enabled,
        ),
        FormBoolFieldFormRowWidget(
          label: S
              .of(context)
              .app_push_settings_field_pleroma_emojiReaction_label,
          field: settingsBloc.pleromaEmojiReactionFieldBloc,
          enabled: settingsBloc.enabled,
        ),
      ],
    );
  }
}
