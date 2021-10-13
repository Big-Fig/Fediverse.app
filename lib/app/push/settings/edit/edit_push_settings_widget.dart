import 'dart:async';

import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/filter/edit/instance/edit_instance_push_filter_settings_dialog.dart';
import 'package:fedi/app/push/settings/filter/push_filter_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/toast/toast_service.dart';
import 'package:fedi/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/url/url_helper.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPushSettingsWidget extends StatefulWidget {
  final bool shrinkWrap;

  const EditPushSettingsWidget({required this.shrinkWrap});

  @override
  EditPushSettingsWidgetState createState() => EditPushSettingsWidgetState();
}

class EditPushSettingsWidgetState extends State<EditPushSettingsWidget> {
  StreamSubscription? failedToUpdateSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var settingsBloc = IPushSettingsBloc.of(context, listen: false);

    failedToUpdateSubscription = settingsBloc.failedToUpdateStream.listen(
      (error) {
        IToastService.of(context, listen: false).showErrorToast(
          context: context,
          title: S.of(context).app_push_settings_update_fail_dialog_title,
          content: error.toString(),
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
          const _EditPushSettingsDescriptionWidget(),
          const _EditPushSettingsFavouriteFieldWidget(),
          const _EditPushSettingsFollowFieldWidget(),
          const _EditPushSettingsMentionFieldWidget(),
          const _EditPushSettingsReblogFieldWidget(),
          const _EditPushSettingsPollFieldWidget(),
          const _EditPushSettingsChatMentionFieldWidget(),
          const _EditPushSettingsEmojiReactionFieldWidget(),
        ],
      );
}

class _EditPushSettingsEmojiReactionFieldWidget extends StatelessWidget {
  const _EditPushSettingsEmojiReactionFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.emojiReactionFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label:
              S.of(context).app_push_settings_field_pleroma_emojiReaction_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditPushSettingsChatMentionFieldWidget extends StatelessWidget {
  const _EditPushSettingsChatMentionFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.chatMentionFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_pleroma_chat_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditPushSettingsPollFieldWidget extends StatelessWidget {
  const _EditPushSettingsPollFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.pollFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_polls_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditPushSettingsReblogFieldWidget extends StatelessWidget {
  const _EditPushSettingsReblogFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.reblogFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_reblogs_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditPushSettingsMentionFieldWidget extends StatelessWidget {
  const _EditPushSettingsMentionFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.mentionFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_mentions_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditPushSettingsFollowFieldWidget extends StatelessWidget {
  const _EditPushSettingsFollowFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.followFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_follows_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditPushSettingsFavouriteFieldWidget extends StatelessWidget {
  const _EditPushSettingsFavouriteFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.favouriteFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_push_settings_field_favourites_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditPushSettingsDescriptionWidget extends StatelessWidget {
  const _EditPushSettingsDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pushSettingsBloc = IPushSettingsBloc.of(context);
    var pushFilterSettingsBloc = IPushFilterSettingsBloc.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            UrlHelper.handleUrlClick(
              context: context,
              url: IConfigService.of(
                context,
                listen: false,
              ).pushDetailsUrl!,
            );
          },
          child: FediNoteDescriptionWidget(
            S.of(context).app_push_settings_desc,
            padding: FediPadding.allSmallPadding,
            style: IFediUiTextTheme.of(context).mediumTallPrimary,
          ),
        ),
        if (pushFilterSettingsBloc.isMyAccountNotificationSettingsSupported &&
            pushSettingsBloc.isHaveSubscription)
          InkWell(
            onTap: () {
              showEditInstancePushFilterSettingsDialog(
                context: context,
              );
            },
            child: FediNoteDescriptionWidget(
              S.of(context).app_push_settings_desc_filters,
              padding: FediPadding.allSmallPadding,
              style: IFediUiTextTheme.of(context).mediumTallPrimary,
            ),
          ),
      ],
    );
  }
}
