import 'dart:convert';

import 'package:fedi/mastodon/api/list/mastodon_list_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_list_model.g.dart';

abstract class IPleromaList extends IMastodonList {}

extension IPleromaListExtension on IPleromaList {
  PleromaList toPleromaList() {
    if (this is PleromaList) {
      return this as PleromaList;
    } else {
      return PleromaList(
        id: id,
        title: title,
      );
    }
  }
}

extension IPleromaListListExtension on List<IPleromaList> {
  List<PleromaList> toPleromaList() {
    if (this is List<PleromaList>) {
      return this as List<PleromaList>;
    } else {
      return map(
        (list) => list.toPleromaList(),
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
class PleromaList extends IPleromaList {
  @override
  @HiveField(0)
  String id;

  @override
  @HiveField(1)
  String title;

  PleromaList({
    required this.id,
    required this.title,
  });

  factory PleromaList.fromJson(Map<String, dynamic> json) =>
      _$PleromaListFromJson(json);

  factory PleromaList.fromJsonString(String jsonString) =>
      _$PleromaListFromJson(jsonDecode(jsonString));

  static List<PleromaList> listFromJsonString(String str) =>
      List<PleromaList>.from(
        json.decode(str).map((x) => PleromaList.fromJson(x)),
      );

  Map<String, dynamic> toJson() => _$PleromaListToJson(this);

  String toJsonString() => jsonEncode(_$PleromaListToJson(this));
}
