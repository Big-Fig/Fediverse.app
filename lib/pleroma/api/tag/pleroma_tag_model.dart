import 'dart:convert';

import 'package:fedi/mastodon/api/tag/mastodon_api_tag_model.dart';
import 'package:fedi/pleroma/api/tag/history/pleroma_tag_history_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_tag_model.g.dart';

abstract class IPleromaTag implements IMastodonApiTag {
  @override
  List<IPleromaTagHistory>? get history;
}

extension IPleromaTagExtension on IPleromaTag {
  PleromaTag toPleromaTag() {
    if (this is PleromaTag) {
      return this as PleromaTag;
    } else {
      return PleromaTag(
        name: name,
        url: url,
        history: history?.toPleromaTagHistories(),
      );
    }
  }
}

extension IPleromaTagListExtension on List<IPleromaTag> {
  List<PleromaTag> toPleromaTags() {
    if (this is List<PleromaTag>) {
      return this as List<PleromaTag>;
    } else {
      return map(
        (pleromaTag) => pleromaTag.toPleromaTag(),
      ).toList();
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 74)
@JsonSerializable()
class PleromaTag implements IPleromaTag {
  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String url;
  @override
  @HiveField(2)
  final List<PleromaTagHistory>? history;

  PleromaTag({
    required this.name,
    required this.url,
    required this.history,
  });

  PleromaTag.only({
    required this.name,
    required this.url,
    this.history,
  });

  factory PleromaTag.fromJson(Map<String, dynamic> json) =>
      _$PleromaTagFromJson(json);

  factory PleromaTag.fromJsonString(String jsonString) =>
      _$PleromaTagFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaTagToJson(this);

  String toJsonString() => jsonEncode(_$PleromaTagToJson(this));
}
