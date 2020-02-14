import 'dart:convert';

import 'package:fedi/Pleroma/Models/Field.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Source.g.dart';

@HiveType()
@JsonSerializable()
class MastodonSource {
  @HiveField(1)
  String privacy;
  @HiveField(2)
  bool sensitive;
  @HiveField(3)
  String language;
  @HiveField(4)
  String note;
  @HiveField(5)
  List<Field> fields;
  @HiveField(6)
  @JsonKey(name: "follow_requests_count")
  int followRequestsCount;

  MastodonSource(
      {this.privacy,
      this.sensitive,
      this.language,
      this.note,
      this.fields,
      this.followRequestsCount});

  factory MastodonSource.fromJson(Map<String, dynamic> json) =>
      _$MastodonSourceFromJson(json);

  factory MastodonSource.fromJsonString(String jsonString) =>
      _$MastodonSourceFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$MastodonSourceToJson(this);

  String toJsonString() => jsonEncode(_$MastodonSourceToJson(this));
}


@JsonSerializable()
class Source extends MastodonSource {
  @HiveField(7)
  SourcePleroma pleroma;

  Source(
      {String privacy,
      bool sensitive,
      String language,
      String note,
      List<Field> fields,
      int followRequestsCount,
      this.pleroma})
      : super(
            privacy: privacy,
            sensitive: sensitive,
            language: language,
            note: note,
            fields: fields,
            followRequestsCount: followRequestsCount);

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  factory Source.fromJsonString(String jsonString) =>
      _$SourceFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  String toJsonString() => jsonEncode(_$SourceToJson(this));
}

@HiveType()
@JsonSerializable()
class SourcePleroma {
  @HiveField(1)
//  show_role: boolean, nullable, true when the user wants his role (e.g admin, moderator) to be shown
  @JsonKey(name: "show_role")
  bool showRole;

  @HiveField(2)
//  no_rich_text - boolean, nullable, true when html tags are stripped from all statuses requested from the API
  @JsonKey(name: "no_rich_text")
  bool noRichText;

  @HiveField(3)
//  discoverable: boolean, true when the user allows discovery of the account in search results and other services.
  bool discoverable;

  @HiveField(4)
  // actor_type: string, the type of this account.
  @JsonKey(name: "actor_type")
  String actorType;

  SourcePleroma(
      {this.showRole, this.noRichText, this.discoverable, this.actorType});

  factory SourcePleroma.fromJson(Map<String, dynamic> json) =>
      _$SourcePleromaFromJson(json);

  factory SourcePleroma.fromJsonString(String jsonString) =>
      _$SourcePleromaFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$SourcePleromaToJson(this);

  String toJsonString() => jsonEncode(_$SourcePleromaToJson(this));
}


// TODO: HIVE doesn't supported inheritance
class SourceAdapter extends TypeAdapter<Source> {
  @override
  Source read(BinaryReader reader) {
    var obj = Source();
    var numOfFields = reader.readByte();
    for (var i = 0; i < numOfFields; i++) {
      switch (reader.readByte()) {
        case 1:
          obj.privacy = reader.read() as String;
          break;
        case 2:
          obj.sensitive = reader.read() as bool;
          break;
        case 3:
          obj.language = reader.read() as String;
          break;
        case 4:
          obj.note = reader.read() as String;
          break;
        case 5:
          obj.fields = (reader.read() as List)?.cast<Field>();
          break;
        case 6:
          obj.followRequestsCount = reader.read() as int;
          break;
        case 7:
          obj.pleroma = reader.read() as SourcePleroma;
          break;
      }
    }
    return obj;
  }

  @override
  void write(BinaryWriter writer, Source obj) {
    writer.writeByte(7);
    writer.writeByte(1);
    writer.write(obj.privacy);
    writer.writeByte(2);
    writer.write(obj.sensitive);
    writer.writeByte(3);
    writer.write(obj.language);
    writer.writeByte(4);
    writer.write(obj.note);
    writer.writeByte(5);
    writer.write(obj.fields);
    writer.writeByte(6);
    writer.write(obj.followRequestsCount);
    writer.writeByte(7);
    writer.write(obj.pleroma);
  }
}
