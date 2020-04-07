import 'dart:convert';

import 'package:fedi/refactored/mastodon/tag/mastodon_tag_model.dart';
import 'package:fedi/refactored/pleroma/history/pleroma_history_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_tag_model.g.dart';

abstract class IPleromaTag implements IMastodonTag {
  @override
  List<IPleromaHistory> get history;
}

@HiveType()
@JsonSerializable()
class PleromaTag implements IPleromaTag {
  @HiveField(0)
  String name;
  @HiveField(1)
  String url;
  @HiveField(2)
  List<PleromaHistory> history;
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
