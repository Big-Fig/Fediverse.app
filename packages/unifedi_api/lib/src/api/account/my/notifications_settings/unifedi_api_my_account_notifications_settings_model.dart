import '../../../unifedi_api_model.dart';

abstract class IUnifediApiMyAccountNotificationsSettings
    implements IUnifediApiResponsePart {
  bool? get followers;

  bool? get follows;

  bool? get nonFollowers;

  bool? get nonFollows;

  bool? get blockFromStrangers;

  bool? get hideNotificationContents;
}
