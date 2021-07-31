import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_list_model.g.dart';

abstract class IPleromaApiList extends IMastodonApiList {}

extension IPleromaApiListExtension on IPleromaApiList {
  PleromaApiList toPleromaApiList({bool forceNewObject = false}) {
    if (this is PleromaApiList && !forceNewObject) {
      return this as PleromaApiList;
    } else {
      return PleromaApiList(
        id: id,
        title: title,
      );
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 80)
@JsonSerializable()
class PleromaApiList extends IPleromaApiList implements IJsonObject {
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

  static PleromaApiList fromJson(Map<String, dynamic> json) =>
      _$PleromaApiListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiListToJson(this);

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
