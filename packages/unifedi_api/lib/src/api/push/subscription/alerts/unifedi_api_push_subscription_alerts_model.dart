import '../../../unifedi_api_model.dart';

abstract class IUnifediApiPushSubscriptionAlerts
    implements IUnifediApiResponsePart {
  bool? get favourite;

  bool? get follow;

  bool? get mention;

  bool? get reblog;

  bool? get poll;

  bool? get chatMention;

  bool? get emojiReaction;
}
