import '../../unifedi_api_model.dart';
import '../../visibility/unifedi_api_visibility_sealed.dart';
import 'poll/unifedi_api_post_status_poll_model.dart';

abstract class IUnifediApiBasePostStatus implements IUnifediApiObject {
  String? get inReplyToConversationId;

  IUnifediApiPostStatusPoll? get poll;

  List<String>? get to;

  bool? get preview;

  String? get contentType;

  int? get expiresInSeconds;

  String? get status;

  List<String>? get mediaIds;

  bool get sensitive;

  String? get spoilerText;

  String get visibility;

  String? get language;

  String? get inReplyToId;
}

abstract class IUnifediApiPostStatus implements IUnifediApiBasePostStatus {}

extension IUnifediApiBasePostStatusExtension on IUnifediApiBasePostStatus {
  UnifediApiVisibility get visibilityAsUnifediApi =>
      UnifediApiVisibility.fromStringValue(
        visibility,
      );
}
