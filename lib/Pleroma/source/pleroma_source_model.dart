import 'dart:convert';

import 'package:fedi/Pleroma/field/pleroma_field_model.dart';
import 'package:fedi/mastodon/source/mastodon_source_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_source_model.g.dart';

abstract class IPleromaSource implements IMastodonSource {
  @override
  List<IPleromaField> get fields;
  PleromaSourcePleromaPart get pleroma;
}

@HiveType()
@JsonSerializable()
class PleromaSource implements IPleromaSource {
  @HiveField(1)
  String privacy;
  @HiveField(2)
  bool sensitive;
  @HiveField(3)
  String language;
  @HiveField(4)
  String note;
  @HiveField(5)
  List<PleromaField> fields;
  @HiveField(6)
  @JsonKey(name: "follow_requests_count")
  int followRequestsCount;
  @HiveField(7)
  PleromaSourcePleromaPart pleroma;


  PleromaSource({this.privacy, this.sensitive, this.language, this.note,
    this.fields, this.followRequestsCount, this.pleroma});

  factory PleromaSource.fromJson(Map<String, dynamic> json) =>
      _$PleromaSourceFromJson(json);

  factory PleromaSource.fromJsonString(String jsonString) =>
      _$PleromaSourceFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaSourceToJson(this);

  String toJsonString() => jsonEncode(_$PleromaSourceToJson(this));
}

@HiveType()
@JsonSerializable()
class PleromaSourcePleromaPart {
  //  show_role: boolean, nullable, true when the user wants his role (e.g admin, moderator) to be shown
  @HiveField(1)
  @JsonKey(name: "show_role")
  bool showRole;

  //  no_rich_text - boolean, nullable, true when html tags are stripped from all statuses requested from the API
  @HiveField(2)
  @JsonKey(name: "no_rich_text")
  bool noRichText;

  //  discoverable: boolean, true when the user allows discovery of the account in search results and other services.
  @HiveField(3)
  bool discoverable;

  // actor_type: string, the type of this account.
  @HiveField(4)
  @JsonKey(name: "actor_type")
  String actorType;

  PleromaSourcePleromaPart(
      {this.showRole, this.noRichText, this.discoverable, this.actorType});

  factory PleromaSourcePleromaPart.fromJson(Map<String, dynamic> json) =>
      _$PleromaSourcePleromaPartFromJson(json);

  factory PleromaSourcePleromaPart.fromJsonString(String jsonString) =>
      _$PleromaSourcePleromaPartFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaSourcePleromaPartToJson(this);

  String toJsonString() => jsonEncode(_$PleromaSourcePleromaPartToJson(this));
}
