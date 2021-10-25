import 'package:pleroma_api/pleroma_api.dart';
import '../../../api/notification/type/unifedi_api_notification_type_sealed.dart';
import '../../../converter/sealed_converter.dart';

const _converter = UnifediApiNotificationTypePleromaConverter();

class UnifediApiNotificationTypePleromaConverter
    implements
        SealedConverter<UnifediApiNotificationType,
            PleromaApiNotificationType> {
  const UnifediApiNotificationTypePleromaConverter();

  @override
  UnifediApiNotificationType convertFrom(
    PleromaApiNotificationType item,
  ) =>
      item.map(
        follow: (_) => UnifediApiNotificationType.followValue,
        favourite: (_) => UnifediApiNotificationType.favouriteValue,
        reblog: (_) => UnifediApiNotificationType.reblogValue,
        mention: (_) => UnifediApiNotificationType.mentionValue,
        poll: (_) => UnifediApiNotificationType.pollValue,
        move: (_) => UnifediApiNotificationType.moveValue,
        followRequest: (_) => UnifediApiNotificationType.followRequestValue,
        pleromaEmojiReaction: (_) =>
            UnifediApiNotificationType.emojiReactionValue,
        pleromaChatMention: (_) => UnifediApiNotificationType.chatMentionValue,
        pleromaReport: (_) => UnifediApiNotificationType.reportValue,
        unknown: (value) => UnifediApiNotificationType.unknown(
          stringValue: value.stringValue,
        ),
      );

  @override
  PleromaApiNotificationType convertTo(
    UnifediApiNotificationType item,
  ) =>
      item.map(
        follow: (_) => PleromaApiNotificationType.followValue,
        favourite: (_) => PleromaApiNotificationType.favouriteValue,
        reblog: (_) => PleromaApiNotificationType.reblogValue,
        mention: (_) => PleromaApiNotificationType.mentionValue,
        poll: (_) => PleromaApiNotificationType.pollValue,
        move: (_) => PleromaApiNotificationType.moveValue,
        followRequest: (_) => PleromaApiNotificationType.followRequestValue,
        emojiReaction: (_) =>
            PleromaApiNotificationType.pleromaEmojiReactionValue,
        chatMention: (_) => PleromaApiNotificationType.pleromaChatMentionValue,
        report: (_) => PleromaApiNotificationType.pleromaReportValue,
        unknown: (value) => PleromaApiNotificationType.unknown(
          stringValue: value.stringValue,
        ),
      );
}

extension PleromaApiNotificationTypeUnifediExtension
    on PleromaApiNotificationType {
  UnifediApiNotificationType toUnifediApiNotificationType() =>
      _converter.convertFrom(this);
}

extension UnifediApiNotificationTypePleromaExtension
    on UnifediApiNotificationType {
  PleromaApiNotificationType toPleromaApiNotificationType() =>
      _converter.convertTo(this);
}

extension UnifediApiNotificationTypePleromaListExtension
    on List<UnifediApiNotificationType> {
  List<PleromaApiNotificationType> toPleromaApiNotificationTypeList() => map(
        (item) => item.toPleromaApiNotificationType(),
      ).toList();
}

extension PleromaApiNotificationTypeUnifediListExtension
    on List<PleromaApiNotificationType> {
  List<UnifediApiNotificationType> toUnifediApiNotificationTypeList() => map(
        (item) => item.toUnifediApiNotificationType(),
      ).toList();
}
