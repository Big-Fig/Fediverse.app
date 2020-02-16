import 'dart:convert';

import 'package:fedi/mastodon/tag/mastodon_tag_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_tag_model.g.dart';

abstract class IPleromaTag implements IMastodonTag {}

@HiveType()
@JsonSerializable()
class PleromaTag implements IPleromaTag {
  @HiveField(0)
  String name;
  @HiveField(1)
  String url;

  PleromaTag({
    this.name,
    this.url,
  });

  factory PleromaTag.fromJson(Map<String, dynamic> json) =>
      _$PleromaTagFromJson(json);

  factory PleromaTag.fromJsonString(String jsonString) =>
      _$PleromaTagFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaTagToJson(this);

  String toJsonString() => jsonEncode(_$PleromaTagToJson(this));
}
