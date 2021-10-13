// ignore_for_file: unnecessary_parenthesis

import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
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

  EditToastSettingsBloc({
    required this.toastSettingsBloc,
    required this.currentInstance,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
  }) : super(
          isEnabled: isEnabled,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          globalOrInstanceSettingsBloc: toastSettingsBloc,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    var isGlobal =
        globalOrInstanceSettingsType == GlobalOrInstanceSettingsType.global;
    var isPleromaOrGlobal = (currentInstance!.isPleroma || isGlobal);

    var isMastodonOrGlobal = currentInstance!.isMastodon || isGlobal;

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
      originValue: currentPushSettings!.poll! && isMastodonOrGlobal,
      isEnabled: isEnabled && isMastodonOrGlobal,
    );
    chatMentionFieldBloc = BoolValueFormFieldBloc(
      originValue: currentPushSettings!.chatMention! && isPleromaOrGlobal,
      isEnabled: isEnabled && isPleromaOrGlobal,
    );
    emojiReactionFieldBloc = BoolValueFormFieldBloc(
      originValue: currentPushSettings!.emojiReaction! && isPleromaOrGlobal,
      isEnabled: isEnabled && isPleromaOrGlobal,
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
  ToastSettings calculateCurrentFormFieldsSettings() {
    return ToastSettings.fromEnum(
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
  }

  @override
  Future fillSettingsToFormFields(ToastSettings settings) async {
    var pushSettings = settings.pushSettings;
    var isNotGlobal =
        globalOrInstanceSettingsType != GlobalOrInstanceSettingsType.global;

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
      pushSettings.poll! && (currentInstance!.isMastodon || isNotGlobal),
    );
    chatMentionFieldBloc.changeCurrentValue(
      pushSettings.chatMention! && (currentInstance!.isPleroma || isNotGlobal),
    );
    emojiReactionFieldBloc.changeCurrentValue(
      pushSettings.emojiReaction! &&
          (currentInstance!.isPleroma || isNotGlobal),
    );

    toastHandlingTypeSingleFromListValueFormFieldBloc.changeCurrentValue(
      settings.handlingType,
    );
  }
}
