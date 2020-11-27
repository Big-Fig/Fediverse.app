import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditToastSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditToastSettingsWidget({@required this.shrinkWrap});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: [
          _EditToastSettingsFavouriteFieldWidget(),
          _EditToastSettingsFollowFieldWidget(),
          _EditToastSettingsMentionFieldWidget(),
          _EditToastSettingsReblogFieldWidget(),
          _EditToastSettingsPollFieldWidget(),
          _EditToastSettingsPleromaMentionFieldWidget(),
          _EditToastSettingsPleromaEmojiReactionFieldWidget(),
        ],
      );
}

class _EditToastSettingsPleromaEmojiReactionFieldWidget
    extends StatelessWidget {
  const _EditToastSettingsPleromaEmojiReactionFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.pleromaEmojiReactionFieldBloc,
      child: BoolValueFormFieldRowWidget(
          label:
              S.of(context).app_push_settings_field_pleroma_emojiReaction_label,
          descriptionOnDisabled: editToastSettingsBloc.enabled
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null),
    );
  }
}

class _EditToastSettingsPleromaMentionFieldWidget extends StatelessWidget {
  const _EditToastSettingsPleromaMentionFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.pleromaChatMentionFieldBloc,
      child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_pleroma_chat_label,
          descriptionOnDisabled: editToastSettingsBloc.enabled
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null),
    );
  }
}

class _EditToastSettingsPollFieldWidget extends StatelessWidget {
  const _EditToastSettingsPollFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.pollFieldBloc,
      child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_polls_label,
          descriptionOnDisabled: editToastSettingsBloc.enabled
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null),
    );
  }
}

class _EditToastSettingsReblogFieldWidget extends StatelessWidget {
  const _EditToastSettingsReblogFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.reblogFieldBloc,
      child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_reblogs_label,
          descriptionOnDisabled: editToastSettingsBloc.enabled
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null),
    );
  }
}

class _EditToastSettingsMentionFieldWidget extends StatelessWidget {
  const _EditToastSettingsMentionFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.mentionFieldBloc,
      child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_mentions_label,
          descriptionOnDisabled: editToastSettingsBloc.enabled
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null),
    );
  }
}

class _EditToastSettingsFollowFieldWidget extends StatelessWidget {
  const _EditToastSettingsFollowFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.followFieldBloc,
      child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_follows_label,
          descriptionOnDisabled: editToastSettingsBloc.enabled
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null),
    );
  }
}

class _EditToastSettingsFavouriteFieldWidget extends StatelessWidget {
  const _EditToastSettingsFavouriteFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);
    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.favouriteFieldBloc,
      child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_favourites_label,
          descriptionOnDisabled: editToastSettingsBloc.enabled
              ? S
                  .of(context)
                  .app_settings_warning_notSupportedOnThisInstance_desc
              : null),
    );
  }
}
