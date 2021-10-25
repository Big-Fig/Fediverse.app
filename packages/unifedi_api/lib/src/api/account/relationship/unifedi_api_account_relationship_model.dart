import '../../unifedi_api_model.dart';

abstract class IUnifediApiAccountRelationship implements IUnifediApiResponse {
  String? get id;

  bool? get blocking;

  bool? get blockedBy;

  bool? get domainBlocking;

  bool? get endorsed;

  bool? get followedBy;

  bool? get following;

  bool? get notifying;

  bool? get muting;

  bool? get mutingNotifications;

  bool? get requested;

  bool? get showingReblogs;

  bool? get subscribing;

  String? get note;
}
