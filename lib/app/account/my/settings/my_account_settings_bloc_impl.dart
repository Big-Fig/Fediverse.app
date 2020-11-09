import 'package:fedi/app/account/my/settings/my_account_settings_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_local_preference_bloc.dart';
import 'package:fedi/app/account/my/settings/my_account_settings_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/localization/localization_current_locale_local_preferences_bloc.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/form_value_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:flutter/widgets.dart';

class MyAccountSettingsBloc extends DisposableOwner
    implements IMyAccountSettingsBloc {
  final IMyAccountSettingsLocalPreferenceBloc localPreferencesBloc;
  final ILocalizationCurrentLocaleLocalPreferencesBloc
      localizationCurrentLocaleLocalPreferencesBloc;
  @override
  final FormBoolFieldBloc isRealtimeWebSocketsEnabledFieldBloc;

  @override
  final FormBoolFieldBloc isNewChatsEnabledFieldBloc;

  @override
  final FormBoolFieldBloc isAlwaysShowSpoilerFieldBloc;
  @override
  final FormBoolFieldBloc isAlwaysShowNsfwFieldBloc;
  @override
  final FormValueFieldBloc<PleromaVisibility> defaultVisibilityFieldBloc;
  @override
  final FormBoolFieldBloc markMediaNsfwByDefaultFieldBloc;
  @override
  final FormBoolFieldBloc foregroundSoundForChatAndDmFieldBloc;
  @override
  final FormBoolFieldBloc foregroundSoundForMentionFieldBloc;

  @override
  final FormBoolFieldBloc mediaAutoInitFieldBloc;

  @override
  final FormBoolFieldBloc mediaAutoPlayFieldBloc;

  @override
  final FormValueFieldBloc<LocalizationLocale> localizationLocaleFieldBloc;

  MyAccountSettingsBloc({
    @required this.localPreferencesBloc,
    @required this.localizationCurrentLocaleLocalPreferencesBloc,
  })  : isRealtimeWebSocketsEnabledFieldBloc = FormBoolFieldBloc(
            originValue:
                localPreferencesBloc.value?.isRealtimeWebSocketsEnabled ??
                    true),
        isNewChatsEnabledFieldBloc = FormBoolFieldBloc(
            originValue: localPreferencesBloc.value?.isNewChatsEnabled ?? true),
        isAlwaysShowSpoilerFieldBloc = FormBoolFieldBloc(
            originValue:
                localPreferencesBloc.value?.isAlwaysShowSpoiler ?? false),
        isAlwaysShowNsfwFieldBloc = FormBoolFieldBloc(
            originValue: localPreferencesBloc.value?.isAlwaysShowNsfw ?? false),
        defaultVisibilityFieldBloc = FormValueFieldBloc<PleromaVisibility>(
            originValue: localPreferencesBloc.value?.defaultVisibility
                    ?.toPleromaVisibility() ??
                PleromaVisibility.public,
            validators: <
                FormValueFieldValidationError Function(PleromaVisibility)>[]),
        localizationLocaleFieldBloc = FormValueFieldBloc<LocalizationLocale>(
          originValue: localizationCurrentLocaleLocalPreferencesBloc.value,
          validators: [],
        ),
        markMediaNsfwByDefaultFieldBloc = FormBoolFieldBloc(
            originValue:
                localPreferencesBloc.value?.markMediaNsfwByDefault ?? false),
        foregroundSoundForChatAndDmFieldBloc = FormBoolFieldBloc(
            originValue:
                localPreferencesBloc.value?.foregroundSoundForChatAndDm ??
                    true),
        foregroundSoundForMentionFieldBloc = FormBoolFieldBloc(
            originValue:
                localPreferencesBloc.value?.foregroundSoundForMention ?? true),
        mediaAutoInitFieldBloc = FormBoolFieldBloc(
            originValue: localPreferencesBloc.value?.mediaAutoInit ?? false),
        mediaAutoPlayFieldBloc = FormBoolFieldBloc(
            originValue: localPreferencesBloc.value?.mediaAutoPlay ?? false) {
    addDisposable(disposable: isRealtimeWebSocketsEnabledFieldBloc);
    addDisposable(disposable: isNewChatsEnabledFieldBloc);
    addDisposable(disposable: isAlwaysShowSpoilerFieldBloc);
    addDisposable(disposable: isAlwaysShowNsfwFieldBloc);
    addDisposable(disposable: defaultVisibilityFieldBloc);
    addDisposable(disposable: markMediaNsfwByDefaultFieldBloc);
    addDisposable(disposable: foregroundSoundForChatAndDmFieldBloc);
    addDisposable(disposable: foregroundSoundForMentionFieldBloc);
    addDisposable(disposable: mediaAutoInitFieldBloc);
    addDisposable(disposable: mediaAutoPlayFieldBloc);

    addDisposable(
        streamSubscription: isRealtimeWebSocketsEnabledFieldBloc
            .currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: isNewChatsEnabledFieldBloc.currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: isAlwaysShowSpoilerFieldBloc.currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: isAlwaysShowNsfwFieldBloc.currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: defaultVisibilityFieldBloc.currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: markMediaNsfwByDefaultFieldBloc.currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: foregroundSoundForChatAndDmFieldBloc
            .currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: foregroundSoundForMentionFieldBloc
            .currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: mediaAutoInitFieldBloc.currentValueStream
            .listen(onSomethingChanged));
    addDisposable(
        streamSubscription: mediaAutoPlayFieldBloc.currentValueStream
            .listen(onSomethingChanged));
  }

  void onSomethingChanged(_) {
    _onSomethingChanged();
  }

  void _onSomethingChanged() {
    var oldPreferences = localPreferencesBloc.value;
    var oldMediaAutoInit = oldPreferences?.mediaAutoInit ?? false;
    var oldMediaAutoPlay = oldPreferences?.mediaAutoPlay ?? false;

    var newMediaAutoInit = mediaAutoInitFieldBloc.currentValue;
    var newMediaAutoPlay = mediaAutoPlayFieldBloc.currentValue;

    if (newMediaAutoPlay == true && oldMediaAutoPlay == false) {
      newMediaAutoInit = true;
      mediaAutoInitFieldBloc.changeCurrentValue(newMediaAutoInit);
    }
    if (newMediaAutoInit == false && oldMediaAutoInit == true) {
      newMediaAutoPlay = false;
      mediaAutoPlayFieldBloc.changeCurrentValue(newMediaAutoPlay);
    }

    var newPreferences = MyAccountSettings(
      isRealtimeWebSocketsEnabled:
          isRealtimeWebSocketsEnabledFieldBloc.currentValue,
      isNewChatsEnabled: isNewChatsEnabledFieldBloc.currentValue,
      isAlwaysShowSpoiler: isAlwaysShowSpoilerFieldBloc.currentValue,
      isAlwaysShowNsfw: isAlwaysShowNsfwFieldBloc.currentValue,
      defaultVisibility: defaultVisibilityFieldBloc.currentValue.toJsonValue(),
      markMediaNsfwByDefault: markMediaNsfwByDefaultFieldBloc.currentValue,
      foregroundSoundForChatAndDm:
          foregroundSoundForChatAndDmFieldBloc.currentValue,
      foregroundSoundForMention:
          foregroundSoundForMentionFieldBloc.currentValue,
      mediaAutoInit: newMediaAutoInit,
      mediaAutoPlay: newMediaAutoPlay,
    );
    if (newPreferences != oldPreferences) {
      localPreferencesBloc.setValue(newPreferences);
    }
  }
}
