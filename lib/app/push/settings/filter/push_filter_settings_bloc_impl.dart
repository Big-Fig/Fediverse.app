import 'dart:async';

import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/account/my/my_account_bloc.dart';
import 'package:fedi/app/push/settings/filter/push_filter_settings_bloc.dart';
import 'package:fedi/app/push/settings/filter/push_filter_settings_model.dart';
import 'package:logging/logging.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _logger = Logger('push_filter_settings_bloc_impl.dart');

class PushFilterSettingsBloc extends DisposableOwner
    implements IPushFilterSettingsBloc {
  final IMyAccountBloc myAccountBloc;
  final IUnifediApiMyAccountService unifediApiMyAccountService;
  final UnifediApiAccess currentInstance;

  PushFilterSettingsBloc({
    required this.myAccountBloc,
    required this.unifediApiMyAccountService,
    required this.currentInstance,
  });

  @override
  PushFilterSettings get settingsData =>
      myAccountBloc.myAccount?.notificationSettings?.toPushFilterSettings() ??
      PushFilterSettings.allDisabled;

  @override
  Stream<PushFilterSettings> get settingsDataStream =>
      myAccountBloc.myAccountStream.map(
        (myAccount) =>
            myAccount?.notificationSettings?.toPushFilterSettings() ??
            PushFilterSettings.allDisabled,
      );

  @override
  Future updateSettings(PushFilterSettings? newSettings) async {
    if (settingsData == newSettings) {
      _logger.finest(() => 'Same settings');

      return;
    }
    var notificationSettings = myAccountBloc.myAccount?.notificationSettings;

    await unifediApiMyAccountService.editNotificationsSettings(
      blockFromStrangers: newSettings?.blockFromStrangers,
      hideNotificationContents: newSettings?.hideNotificationContents,
    );

    var currentNotificationSettings =
        notificationSettings?.toUnifediApiMyAccountNotificationsSettings() ??
            UnifediApiMyAccountNotificationsSettings(
              followers: null,
              follows: null,
              nonFollowers: null,
              nonFollows: null,
              blockFromStrangers: null,
              hideNotificationContents: null,
            );

    var editedSettingsNotificationSettings =
        currentNotificationSettings.copyWith(
      blockFromStrangers: newSettings?.blockFromStrangers,
      hideNotificationContents: newSettings?.hideNotificationContents,
    );

    var newMyAccount = myAccountBloc.myAccount!.copyWithTemp(
      notificationSettings: editedSettingsNotificationSettings,
    );

    await myAccountBloc.updateMyAccountByMyAccount(newMyAccount);
  }

  @override
  bool get isMyAccountNotificationSettingsSupported =>
      unifediApiMyAccountService.isFeatureSupported(
        unifediApiMyAccountService.editNotificationsSettingsFeature,
      );

  @override
  bool get blockFromStrangers => settingsData.blockFromStrangers == true;

  @override
  Stream<bool> get blockFromStrangersStream =>
      settingsDataStream.map((settings) => settings.blockFromStrangers == true);

  @override
  Future changeBlockFromStrangers(bool value) => updateSettings(
        settingsData.copyWith(
          blockFromStrangers: value,
        ),
      );

  @override
  bool get hideNotificationContents =>
      settingsData.hideNotificationContents == true;

  @override
  Stream<bool> get hideNotificationContentsStream => settingsDataStream
      .map((settings) => settings.hideNotificationContents == true);

  @override
  Future changeHideNotificationContents(bool value) => updateSettings(
        settingsData.copyWith(
          hideNotificationContents: value,
        ),
      );
}
