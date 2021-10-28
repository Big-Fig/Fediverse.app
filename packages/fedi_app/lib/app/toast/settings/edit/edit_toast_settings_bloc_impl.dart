// ignore_for_file: unnecessary_parenthesis

import 'package:fedi_app/app/push/settings/push_settings_model.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi_app/app/toast/settings/toast_settings_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EditToastSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<ToastSettings>
    implements IEditToastSettingsBloc {
  final IToastSettingsBloc toastSettingsBloc;

  final UnifediApiAccess? currentInstance;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc favouriteFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc followFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc mentionFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc reblogFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc pollFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc chatMentionFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc emojiReactionFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IToastHandlingTypeSingleFromListValueFormFieldBloc
      toastHandlingTypeSingleFromListValueFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        favouriteFieldBloc,
        followFieldBloc,
        mentionFieldBloc,
        reblogFieldBloc,
        pollFieldBloc,
        chatMentionFieldBloc,
        emojiReactionFieldBloc,
        toastHandlingTypeSingleFromListValueFormFieldBloc,
      ];

  PushSettings? get currentPushSettings => currentSettings.pushSettings;

  final IUnifediApiPushSubscriptionService unifediApiPushSubscriptionService;

  bool get isPollSupported =>
      currentInstance!.instance!.typeAsUnifediApi.isMastodon || isGlobal;

  bool get isChatMentionSupported =>
      unifediApiPushSubscriptionService.isFeatureSupported(
        unifediApiPushSubscriptionService.subscribeChatMentionFeature,
      ) ||
      isGlobal;
  bool get isEmojiReactionSupported =>
      unifediApiPushSubscriptionService.isFeatureSupported(
        unifediApiPushSubscriptionService.subscribeEmojiReactionFeature,
      ) ||
      isGlobal;

  EditToastSettingsBloc({
    required this.toastSettingsBloc,
    required this.currentInstance,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
    required this.unifediApiPushSubscriptionService,
  }) : super(
          isEnabled: isEnabled,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          globalOrInstanceSettingsBloc: toastSettingsBloc,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    favouriteFieldBloc = BoolValueFormFieldBloc(
      originValue: currentPushSettings!.favourite,
      isEnabled: isEnabled,
    );

    followFieldBloc = BoolValueFormFieldBloc(
      originValue: currentPushSettings!.follow,
      isEnabled: isEnabled,
    );
    mentionFieldBloc = BoolValueFormFieldBloc(
      originValue: currentPushSettings!.mention,
      isEnabled: isEnabled,
    );
    reblogFieldBloc = BoolValueFormFieldBloc(
      originValue: currentPushSettings!.reblog,
      isEnabled: isEnabled,
    );
    pollFieldBloc = BoolValueFormFieldBloc(
      originValue: currentPushSettings!.poll! && isPollSupported,
      isEnabled: isEnabled && isPollSupported,
    );
    chatMentionFieldBloc = BoolValueFormFieldBloc(
      originValue: currentPushSettings!.chatMention! && isChatMentionSupported,
      isEnabled: isEnabled && isChatMentionSupported,
    );
    emojiReactionFieldBloc = BoolValueFormFieldBloc(
      originValue:
          currentPushSettings!.emojiReaction! && isEmojiReactionSupported,
      isEnabled: isEnabled && isEmojiReactionSupported,
    );

    toastHandlingTypeSingleFromListValueFormFieldBloc =
        ToastHandlingTypeSingleFromListValueFormFieldBloc(
      originValue: currentSettings.handlingType,
      isEnabled: isEnabled,
    );

    onFormItemsChanged();

    addDisposable(favouriteFieldBloc);
    addDisposable(followFieldBloc);
    addDisposable(mentionFieldBloc);
    addDisposable(reblogFieldBloc);
    addDisposable(pollFieldBloc);
    addDisposable(chatMentionFieldBloc);
    addDisposable(emojiReactionFieldBloc);
    addDisposable(
      toastHandlingTypeSingleFromListValueFormFieldBloc,
    );
  }

  @override
  ToastSettings calculateCurrentFormFieldsSettings() => ToastSettings.fromEnum(
        pushSettings: PushSettings(
          favourite: favouriteFieldBloc.currentValue,
          follow: followFieldBloc.currentValue,
          mention: mentionFieldBloc.currentValue,
          reblog: reblogFieldBloc.currentValue,
          poll: pollFieldBloc.currentValue,
          chatMention: chatMentionFieldBloc.currentValue,
          emojiReaction: emojiReactionFieldBloc.currentValue,
        ),
        handlingType:
            toastHandlingTypeSingleFromListValueFormFieldBloc.currentValue,
      );

  @override
  Future<void> fillSettingsToFormFields(ToastSettings settings) async {
    var pushSettings = settings.pushSettings;

    favouriteFieldBloc.changeCurrentValue(
      pushSettings.favourite,
    );
    followFieldBloc.changeCurrentValue(
      pushSettings.follow,
    );
    mentionFieldBloc.changeCurrentValue(
      pushSettings.mention,
    );
    reblogFieldBloc.changeCurrentValue(
      pushSettings.reblog,
    );
    pollFieldBloc.changeCurrentValue(
      pushSettings.poll == true && isPollSupported,
    );
    chatMentionFieldBloc.changeCurrentValue(
      pushSettings.chatMention == true && isChatMentionSupported,
    );
    emojiReactionFieldBloc.changeCurrentValue(
      pushSettings.emojiReaction == true && isEmojiReactionSupported,
    );

    toastHandlingTypeSingleFromListValueFormFieldBloc.changeCurrentValue(
      settings.handlingType,
    );
  }
}
