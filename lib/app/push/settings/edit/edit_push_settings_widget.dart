import 'dart:async';

import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
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

    failedToUpdateSubscription = settingsBloc.failedToUpdateStream.listen(
      (error) {
        IToastService.of(context, listen: false).showErrorToast(
          context: context,
          title: S.of(context).app_push_settings_update_fail_dialog_title,
          content: error?.toString(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    failedToUpdateSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: widget.shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: [
          const _EditPushSettingsDescWidget(),
          const _EditPushSettingsFavouriteFieldWidget(),
          const _EditPushSettingsFollowFieldWidget(),
          const _EditPushSettingsMentionFieldWidget(),
          const _EditPushSettingsReblogFieldWidget(),
          const _EditPushSettingsPollFieldWidget(),
          const _EditPushSettingsPleromaMentionFieldWidget(),
          const _EditPushSettingsPleromaEmojiReactionFieldWidget(),
        ],
      );
}

class _EditPushSettingsPleromaEmojiReactionFieldWidget extends StatelessWidget {
  const _EditPushSettingsPleromaEmojiReactionFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editPushSettingsBloc = IEditPushSettingsBloc.of(context);

    var isPleromaInstance =
        ICurrentAuthInstanceBloc.of(context).currentInstance.isPleromaInstance;

    return StreamBuilder<bool>(
      stream: editPushSettingsBloc.enabledStream,
      initialData: editPushSettingsBloc.enabled,
      builder: (context, snapshot) {
        var enabled = snapshot.data;
        var supported = isPleromaInstance;
        return BoolValueFormFieldRowWidget(
          label:
              S.of(context).app_push_settings_field_pleroma_emojiReaction_label,
          field: editPushSettingsBloc.pleromaEmojiReactionFieldBloc,
          enabled: enabled && isPleromaInstance,
          description: !supported
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null,
        );
      },
    );
  }
}

class _EditPushSettingsPleromaMentionFieldWidget extends StatelessWidget {
  const _EditPushSettingsPleromaMentionFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editPushSettingsBloc = IEditPushSettingsBloc.of(context);

    var isPleromaInstance =
        ICurrentAuthInstanceBloc.of(context).currentInstance.isPleromaInstance;

    return StreamBuilder<bool>(
      stream: editPushSettingsBloc.enabledStream,
      initialData: editPushSettingsBloc.enabled,
      builder: (context, snapshot) {
        var enabled = snapshot.data;
        var supported = isPleromaInstance;
        return BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_pleroma_chat_label,
          field: editPushSettingsBloc.pleromaChatMentionFieldBloc,
          enabled: enabled && isPleromaInstance,
          description: !supported
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null,
        );
      },
    );
  }
}

class _EditPushSettingsPollFieldWidget extends StatelessWidget {
  const _EditPushSettingsPollFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editPushSettingsBloc = IEditPushSettingsBloc.of(context);

    var isPleromaInstance =
        ICurrentAuthInstanceBloc.of(context).currentInstance.isPleromaInstance;

    return StreamBuilder<bool>(
      stream: editPushSettingsBloc.enabledStream,
      initialData: editPushSettingsBloc.enabled,
      builder: (context, snapshot) {
        var enabled = snapshot.data;
        var supported = !isPleromaInstance;
        return BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_polls_label,
          field: editPushSettingsBloc.pollFieldBloc,
          enabled: enabled && supported,
          description: !supported
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null,
        );
      },
    );
  }
}

class _EditPushSettingsReblogFieldWidget extends StatelessWidget {
  const _EditPushSettingsReblogFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editPushSettingsBloc = IEditPushSettingsBloc.of(context);

    return StreamBuilder<bool>(
      stream: editPushSettingsBloc.enabledStream,
      initialData: editPushSettingsBloc.enabled,
      builder: (context, snapshot) {
        var enabled = snapshot.data;
        return BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_reblogs_label,
          field: editPushSettingsBloc.reblogFieldBloc,
          enabled: enabled,
        );
      },
    );
  }
}

class _EditPushSettingsMentionFieldWidget extends StatelessWidget {
  const _EditPushSettingsMentionFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editPushSettingsBloc = IEditPushSettingsBloc.of(context);

    return StreamBuilder<bool>(
      stream: editPushSettingsBloc.enabledStream,
      initialData: editPushSettingsBloc.enabled,
      builder: (context, snapshot) {
        var enabled = snapshot.data;
        return BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_mentions_label,
          field: editPushSettingsBloc.mentionFieldBloc,
          enabled: enabled,
        );
      },
    );
  }
}

class _EditPushSettingsFollowFieldWidget extends StatelessWidget {
  const _EditPushSettingsFollowFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editPushSettingsBloc = IEditPushSettingsBloc.of(context);

    return StreamBuilder<bool>(
      stream: editPushSettingsBloc.enabledStream,
      initialData: editPushSettingsBloc.enabled,
      builder: (context, snapshot) {
        var enabled = snapshot.data;
        return BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_follows_label,
          field: editPushSettingsBloc.followFieldBloc,
          enabled: enabled,
        );
      },
    );
  }
}

class _EditPushSettingsFavouriteFieldWidget extends StatelessWidget {
  const _EditPushSettingsFavouriteFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editPushSettingsBloc = IEditPushSettingsBloc.of(context);

    return StreamBuilder<bool>(
      stream: editPushSettingsBloc.enabledStream,
      initialData: editPushSettingsBloc.enabled,
      builder: (context, snapshot) {
        var enabled = snapshot.data;
        return BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_favourites_label,
          field: editPushSettingsBloc.favouriteFieldBloc,
          enabled: enabled,
        );
      },
    );
  }
}

class _EditPushSettingsDescWidget extends StatelessWidget {
  const _EditPushSettingsDescWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).app_push_settings_desc,
      style: IFediUiTextTheme.of(context).smallShortBoldLightGrey,
    );
  }
}
