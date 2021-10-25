import '../../../pleroma_api_model.dart';

abstract class IPleromaApiMyAccountNotificationsSettings
    implements IPleromaApiResponsePart {
  bool? get followers;

  bool? get follows;

  bool? get nonFollowers;

  bool? get nonFollows;

  bool? get blockFromStrangers;

  bool? get hideNotificationContents;
}
