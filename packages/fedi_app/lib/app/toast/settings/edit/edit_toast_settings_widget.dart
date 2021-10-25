import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditToastSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditToastSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: [
          ProxyProvider<IEditToastSettingsBloc,
              IToastHandlingTypeSingleFromListValueFormFieldBloc>(
            update: (context, value, previous) =>
                value.toastHandlingTypeSingleFromListValueFormFieldBloc,
            child:
                const ToastHandlingTypeSingleFromListValueFormFieldRowWidget(),
          ),
          const _EditToastSettingsFavouriteFieldWidget(),
          const _EditToastSettingsFollowFieldWidget(),
          const _EditToastSettingsMentionFieldWidget(),
          const _EditToastSettingsReblogFieldWidget(),
          const _EditToastSettingsPollFieldWidget(),
          const _EditToastSettingsUnifediMentionFieldWidget(),
          const _EditToastSettingsEmojiReactionFieldWidget(),
        ],
      );
}

class _EditToastSettingsEmojiReactionFieldWidget extends StatelessWidget {
  const _EditToastSettingsEmojiReactionFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);

    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.emojiReactionFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_push_settings_field_emojiReaction_label,
        descriptionOnDisabled: editToastSettingsBloc.isEnabled
            ? S.of(context).app_settings_warning_notSupportedOnThisInstance_desc
            : null,
      ),
    );
  }
}

class _EditToastSettingsUnifediMentionFieldWidget extends StatelessWidget {
  const _EditToastSettingsUnifediMentionFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);

    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.chatMentionFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_push_settings_field_chat_label,
        descriptionOnDisabled: editToastSettingsBloc.isEnabled
            ? S.of(context).app_settings_warning_notSupportedOnThisInstance_desc
            : null,
      ),
    );
  }
}

class _EditToastSettingsPollFieldWidget extends StatelessWidget {
  const _EditToastSettingsPollFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);

    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.pollFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_push_settings_field_polls_label,
        descriptionOnDisabled: editToastSettingsBloc.isEnabled
            ? S.of(context).app_settings_warning_notSupportedOnThisInstance_desc
            : null,
      ),
    );
  }
}

class _EditToastSettingsReblogFieldWidget extends StatelessWidget {
  const _EditToastSettingsReblogFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);

    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.reblogFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_push_settings_field_reblogs_label,
        descriptionOnDisabled: editToastSettingsBloc.isEnabled
            ? S.of(context).app_settings_warning_notSupportedOnThisInstance_desc
            : null,
      ),
    );
  }
}

class _EditToastSettingsMentionFieldWidget extends StatelessWidget {
  const _EditToastSettingsMentionFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);

    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.mentionFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_push_settings_field_mentions_label,
        descriptionOnDisabled: editToastSettingsBloc.isEnabled
            ? S.of(context).app_settings_warning_notSupportedOnThisInstance_desc
            : null,
      ),
    );
  }
}

class _EditToastSettingsFollowFieldWidget extends StatelessWidget {
  const _EditToastSettingsFollowFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);

    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.followFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_push_settings_field_follows_label,
        descriptionOnDisabled: editToastSettingsBloc.isEnabled
            ? S.of(context).app_settings_warning_notSupportedOnThisInstance_desc
            : null,
      ),
    );
  }
}

class _EditToastSettingsFavouriteFieldWidget extends StatelessWidget {
  const _EditToastSettingsFavouriteFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editToastSettingsBloc = IEditToastSettingsBloc.of(context);

    return ProxyProvider<IEditToastSettingsBloc, IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.favouriteFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S.of(context).app_push_settings_field_favourites_label,
        descriptionOnDisabled: editToastSettingsBloc.isEnabled
            ? S.of(context).app_settings_warning_notSupportedOnThisInstance_desc
            : null,
      ),
    );
  }
}
