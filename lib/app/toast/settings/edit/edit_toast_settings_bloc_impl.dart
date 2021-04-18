import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/toast/handling_type/form/toast_handling_type_single_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/toast/handling_type/toast_handling_type_model.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';

class EditToastSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<ToastSettings?>
    implements IEditToastSettingsBloc {
  final IToastSettingsBloc toastSettingsBloc;

  final AuthInstance? currentInstance;

  @override
  late IBoolValueFormFieldBloc favouriteFieldBloc;
  @override
  late IBoolValueFormFieldBloc followFieldBloc;
  @override
  late IBoolValueFormFieldBloc mentionFieldBloc;
  @override
  late IBoolValueFormFieldBloc reblogFieldBloc;
  @override
  late IBoolValueFormFieldBloc pollFieldBloc;
  @override
  late IBoolValueFormFieldBloc pleromaChatMentionFieldBloc;
  @override
  late IBoolValueFormFieldBloc pleromaEmojiReactionFieldBloc;

  @override
  late IToastHandlingTypeSingleFromListValueFormFieldBloc
      toastHandlingTypeSingleFromListValueFormFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        favouriteFieldBloc,
        followFieldBloc,
        mentionFieldBloc,
        reblogFieldBloc,
        pollFieldBloc,
        pleromaChatMentionFieldBloc,
        pleromaEmojiReactionFieldBloc,
        toastHandlingTypeSingleFromListValueFormFieldBloc,
      ];

  PushSettings? get currentPushSettings => currentSettings?.pushSettings;

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

    var isMastodonOrGlobal = (currentInstance!.isMastodon || isGlobal);

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
    pleromaChatMentionFieldBloc = BoolValueFormFieldBloc(
      originValue:
          currentPushSettings!.pleromaChatMention! && isPleromaOrGlobal,
      isEnabled: isEnabled && isPleromaOrGlobal,
    );
    pleromaEmojiReactionFieldBloc = BoolValueFormFieldBloc(
      originValue:
          currentPushSettings!.pleromaEmojiReaction! && isPleromaOrGlobal,
      isEnabled: isEnabled && isPleromaOrGlobal,
    );

    toastHandlingTypeSingleFromListValueFormFieldBloc =
        ToastHandlingTypeSingleFromListValueFormFieldBloc(
      originValue: currentSettings?.handlingType,
      isEnabled: isEnabled,
    );

    onFormItemsChanged();

    addDisposable(disposable: favouriteFieldBloc);
    addDisposable(disposable: followFieldBloc);
    addDisposable(disposable: mentionFieldBloc);
    addDisposable(disposable: reblogFieldBloc);
    addDisposable(disposable: pollFieldBloc);
    addDisposable(disposable: pleromaChatMentionFieldBloc);
    addDisposable(disposable: pleromaEmojiReactionFieldBloc);
    addDisposable(
      disposable: toastHandlingTypeSingleFromListValueFormFieldBloc,
    );
  }

  @override
  ToastSettings calculateCurrentFormFieldsSettings() {
    return ToastSettings(
      pushSettings: PushSettings(
        favourite: favouriteFieldBloc.currentValue,
        follow: followFieldBloc.currentValue,
        mention: mentionFieldBloc.currentValue,
        reblog: reblogFieldBloc.currentValue,
        poll: pollFieldBloc.currentValue,
        pleromaChatMention: pleromaChatMentionFieldBloc.currentValue,
        pleromaEmojiReaction: pleromaEmojiReactionFieldBloc.currentValue,
      ),
      handlingTypeString: toastHandlingTypeSingleFromListValueFormFieldBloc
          .currentValue
          ?.toJsonValue(),
    );
  }

  @override
  Future fillSettingsToFormFields(ToastSettings? settings) async {
    var pushSettings = settings!.pushSettings!;
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
    pleromaChatMentionFieldBloc.changeCurrentValue(
      pushSettings.pleromaChatMention! &&
          (currentInstance!.isPleroma || isNotGlobal),
    );
    pleromaEmojiReactionFieldBloc.changeCurrentValue(
      pushSettings.pleromaEmojiReaction! &&
          (currentInstance!.isPleroma || isNotGlobal),
    );

    toastHandlingTypeSingleFromListValueFormFieldBloc.changeCurrentValue(
      settings.handlingType,
    );
  }
}
