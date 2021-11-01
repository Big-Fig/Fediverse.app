import '../../../unifedi_api_model.dart';
import '../../../visibility/unifedi_api_visibility_sealed.dart';
import '../../post/poll/unifedi_api_post_status_poll_model.dart';

abstract class IUnifediApiScheduledStatusParams
    implements IUnifediApiResponsePart {
  List<String>? get to;

  String? get inReplyToConversationId;

  int? get expiresInSeconds;

  String? get text;

  List<String>? get mediaIds;

  bool get sensitive;

  String? get spoilerText;

  String get visibility;

  DateTime? get scheduledAt;

  String? get inReplyToId;

  String? get language;

  IUnifediApiPostStatusPoll? get poll;
}

extension IUnifediApiScheduledStatusParamsExtension
    on IUnifediApiScheduledStatusParams {
  UnifediApiVisibility get visibilityAsUnifediApi =>
      UnifediApiVisibility.fromStringValue(visibility);
}
