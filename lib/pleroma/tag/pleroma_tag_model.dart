import 'dart:convert';

import 'package:fedi/mastodon/tag/mastodon_tag_model.dart';
import 'package:fedi/pleroma/history/pleroma_history_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_tag_model.g.dart';

abstract class IPleromaTag implements IMastodonTag {
  @override
  List<IPleromaHistory> get history;
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
@HiveType()
// @HiveType(typeId: -32 + 74)
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
  final List<PleromaHistory> history;
  PleromaTag({
    this.name,
    this.url,
    this.history,
  });

  factory PleromaTag.fromJson(Map<String, dynamic> json) =>
      _$PleromaTagFromJson(json);

  factory PleromaTag.fromJsonString(String jsonString) =>
      _$PleromaTagFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaTagToJson(this);

  String toJsonString() => jsonEncode(_$PleromaTagToJson(this));
}
