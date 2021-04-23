import 'dart:convert';

import 'package:fedi/mastodon/api/list/mastodon_api_list_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_list_model.g.dart';

abstract class IPleromaApiList extends IMastodonApiList {}

extension IPleromaApiListExtension on IPleromaApiList {
  PleromaApiList toPleromaApiList() {
    if (this is PleromaApiList) {
      return this as PleromaApiList;
    } else {
      return PleromaApiList(
        id: id,
        title: title,
      );
    }
  }
}

extension IPleromaApiListListExtension on List<IPleromaApiList> {
  List<PleromaApiList> toPleromaApiListList() {
    if (this is List<PleromaApiList>) {
      return this as List<PleromaApiList>;
    } else {
      return map(
        (list) => list.toPleromaApiList(),
      ).toList();
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 80)
@JsonSerializable()
class PleromaApiList extends IPleromaApiList {
  @override
  @HiveField(0)
  String id;

  @override
  @HiveField(1)
  String title;

  PleromaApiList({
    required this.id,
    required this.title,
  });

  factory PleromaApiList.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiListFromJson(json);

  factory PleromaApiList.fromJsonString(String jsonString) =>
      _$PleromaApiListFromJson(jsonDecode(jsonString));

  static List<PleromaApiList> listFromJsonString(String str) =>
      List<PleromaApiList>.from(
        json.decode(str).map((x) => PleromaApiList.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaApiListToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApiListToJson(this));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiList &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'PleromaApiList{'
        'id: $id, '
        'title: $title'
        '}';
  }
}
