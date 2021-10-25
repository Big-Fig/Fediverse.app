import '../emoji/reaction/unifedi_api_emoji_reaction_model.dart';
import '../mention/unifedi_api_mention_model.dart';
import '../status/unifedi_api_status_model.dart';
import '../tag/unifedi_api_tag_model.dart';
import '../unifedi_api_model.dart';

abstract class IUnifediApiAnnouncement implements IUnifediApiResponse {
  List<IUnifediApiEmojiReaction>? get reactions;

  List<IUnifediApiMention>? get mentions;

  List<IUnifediApiStatus>? get statuses;

  List<IUnifediApiTag>? get tags;

  String get id;

  String get content;

  bool get allDay;

  DateTime get publishedAt;

  DateTime get updatedAt;

  bool? get read;

  DateTime? get scheduledAt;

  DateTime? get startsAt;

  DateTime? get endsAt;
}
