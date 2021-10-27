import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/push/permission/ask/local_preferences/ask_push_permission_local_preference_bloc.dart';
import 'package:fedi_app/app/push/permission/checker/push_permission_checker_bloc.dart';
import 'package:fedi_app/app/push/settings/push_settings_bloc.dart';
import 'package:fedi_app/push/fcm/fcm_push_service.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger('push_permission_checker_bloc_impl.dart');

class PushPermissionCheckerBloc extends DisposableOwner
    implements IPushPermissionCheckerBloc {
  final IFcmPushService fcmPushService;
  final IConfigService configService;
  final IAskPushPermissionLocalPreferenceBloc
      askPushPermissionLocalPreferenceBloc;
  final IPushSettingsBloc pushSettingsBloc;

  PushPermissionCheckerBloc({
    @required required this.fcmPushService,
    required this.askPushPermissionLocalPreferenceBloc,
    required this.pushSettingsBloc,
    required this.configService,
  });

  @override
  Future<bool> checkAndSubscribe() async {
    await askPushPermissionLocalPreferenceBloc.setValue(true);
    var success = await fcmPushService.askPermissions();

    _logger.finest(() => 'checkAndSubscribe success $success');

    bool result;
    if (success) {
      try {
        _logger.finest(() => 'checkAndSubscribe subscribeAllEnabled');
        await pushSettingsBloc.subscribeAllEnabled();
        result = true;
        // ignore: avoid_catches_without_on_clauses
      } catch (e, stackTrace) {
        _logger.warning(
          () => 'failed to subscribeWithDefaultPreferences',
          e,
          stackTrace,
        );
        result = false;
      }
    } else {
      result = false;
    }

    _logger.finest(() => 'checkAndSubscribe result $result');

    return result;
  }

  @override
  bool get isNeedCheckPermission =>
      !askPushPermissionLocalPreferenceBloc.value &&
      !pushSettingsBloc.isHaveSubscription;

  @override
  Future<void> onCheckDismissed() =>
      askPushPermissionLocalPreferenceBloc.setValue(true);

  static PushPermissionCheckerBloc createFromContext(
    BuildContext context,
  ) =>
      PushPermissionCheckerBloc(
        fcmPushService: IFcmPushService.of(
          context,
          listen: false,
        ),
        configService: IConfigService.of(
          context,
          listen: false,
        ),
        askPushPermissionLocalPreferenceBloc:
            IAskPushPermissionLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        pushSettingsBloc: IPushSettingsBloc.of(
          context,
          listen: false,
        ),
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
  }) =>
      DisposableProvider<IPushPermissionCheckerBloc>(
        create: PushPermissionCheckerBloc.createFromContext,
        child: child,
      );
}
