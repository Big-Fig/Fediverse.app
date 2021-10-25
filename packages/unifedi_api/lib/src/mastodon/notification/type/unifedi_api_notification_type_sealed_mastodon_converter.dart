import 'package:mastodon_api/mastodon_api.dart';
import '../../../api/notification/type/unifedi_api_notification_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiNotificationTypeMastodonConverter();

class UnifediApiNotificationTypeMastodonConverter
    implements
        SealedConverter<UnifediApiNotificationType,
            MastodonApiNotificationType> {
  const UnifediApiNotificationTypeMastodonConverter();

  @override
  UnifediApiNotificationType convertFrom(
    MastodonApiNotificationType item,
  ) =>
      item.map(
        follow: (_) => UnifediApiNotificationType.followValue,
        favourite: (_) => UnifediApiNotificationType.favouriteValue,
        reblog: (_) => UnifediApiNotificationType.reblogValue,
        mention: (_) => UnifediApiNotificationType.mentionValue,
        poll: (_) => UnifediApiNotificationType.pollValue,
        move: (_) => UnifediApiNotificationType.moveValue,
        followRequest: (_) => UnifediApiNotificationType.followRequestValue,
        unknown: (value) => UnifediApiNotificationType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  MastodonApiNotificationType convertTo(
    UnifediApiNotificationType item,
  ) =>
      item.map(
        follow: (_) => MastodonApiNotificationType.followValue,
        favourite: (_) => MastodonApiNotificationType.favouriteValue,
        reblog: (_) => MastodonApiNotificationType.reblogValue,
        mention: (_) => MastodonApiNotificationType.mentionValue,
        poll: (_) => MastodonApiNotificationType.pollValue,
        move: (_) => MastodonApiNotificationType.moveValue,
        followRequest: (_) => MastodonApiNotificationType.followRequestValue,
        // ignore: no-equal-arguments
        emojiReaction: (value) => MastodonApiNotificationType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        chatMention: (value) => MastodonApiNotificationType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        report: (value) => MastodonApiNotificationType.unknown(
          stringValue: value.stringValue,
        ),
        // ignore: no-equal-arguments
        unknown: (value) => MastodonApiNotificationType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension MastodonApiNotificationTypeUnifediExtension
    on MastodonApiNotificationType {
  UnifediApiNotificationType toUnifediApiNotificationType() =>
      _converter.convertFrom(this);
}

extension UnifediApiNotificationTypeMastodonExtension
    on UnifediApiNotificationType {
  MastodonApiNotificationType toMastodonApiNotificationType() =>
      _converter.convertTo(this);
}

extension UnifediApiNotificationTypeMastodonListExtension
    on List<UnifediApiNotificationType> {
  List<MastodonApiNotificationType> toMastodonApiNotificationTypeList() => map(
        (item) => item.toMastodonApiNotificationType(),
      ).toList();
}

extension MastodonApiNotificationTypeUnifediListExtension
    on List<MastodonApiNotificationType> {
  List<UnifediApiNotificationType> toUnifediApiNotificationTypeList() => map(
        (item) => item.toUnifediApiNotificationType(),
      ).toList();
}
