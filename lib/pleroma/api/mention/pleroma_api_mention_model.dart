import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/mention/mastodon_api_mention_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_mention_model.g.dart';

abstract class IPleromaApiMention implements IMastodonApiMention {}

extension IPleromaApiMentionExtension on IPleromaApiMention {
  PleromaApiMention toPleromaApiMention({bool forceNewObject = false}) {
    if (this is PleromaApiMention && !forceNewObject) {
      return this as PleromaApiMention;
    } else {
      return PleromaApiMention(
        acct: acct,
        id: id,
        url: url,
        username: username,
      );
    }
  }
}

extension IPleromaApiMentionListExtension on List<IPleromaApiMention> {
  List<PleromaApiMention> toPleromaApiMentions({bool forceNewObject = false}) {
    if (this is List<PleromaApiMention> && !forceNewObject) {
      return this as List<PleromaApiMention>;
    } else {
      return map(
        (pleromaApiMention) => pleromaApiMention.toPleromaApiMention(
          forceNewObject: forceNewObject,
        ),
      ).toList();
    }
  }

  List<String> toAccts() {
    return map(
      (pleromaApiMention) => pleromaApiMention.acct,
    ).toList();
  }
}

@JsonSerializable(explicitToJson: true)
class PleromaApiMention implements IPleromaApiMention, IJsonObject {
  @override
  final String acct;
  @override
  @JsonKey(fromJson: fromIdJson)
  final String id;
  @override
  final String url;
  @override
  final String? username;

  PleromaApiMention({
    required this.acct,
    required this.id,
    required this.url,
    required this.username,
  });

  PleromaApiMention.only({
    required this.acct,
    required this.id,
    required this.url,
    this.username,
  });

  static PleromaApiMention fromJson(Map<String, dynamic> json) =>
      _$PleromaApiMentionFromJson(json);

  // hack for internal flutter issues cause
  // exception: type '_Smi' is not a subtype of type 'String'
  static String fromIdJson(dynamic json) => json.toString();

  @override
  Map<String, dynamic> toJson() => _$PleromaApiMentionToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiMention &&
          runtimeType == other.runtimeType &&
          acct == other.acct &&
          id == other.id &&
          url == other.url &&
          username == other.username;

  @override
  int get hashCode =>
      acct.hashCode ^ id.hashCode ^ url.hashCode ^ username.hashCode;

  @override
  String toString() {
    return 'PleromaApiMention{'
        'acct: $acct, '
        'id: $id, '
        'url: $url, '
        'username: $username'
        '}';
  }
}
