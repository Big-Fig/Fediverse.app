import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IFediPushNotification implements IJsonObj {
  String get notificationId;
  String get server;
  String get account;
  String get notificationType;
  IUnifediApiNotification? get unifediApiNotification;
  String? get notificationAction;
  String? get notificationActionInput;
}

extension IFediPushNotificationExtension on IFediPushNotification {
  String get userAtHost => '$account@$server';
}
