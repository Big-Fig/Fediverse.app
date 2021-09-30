import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:unifedi_api/unifedi_api.dart';

// ignore_for_file: no-magic-number
part 'access_list_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 115)
@JsonSerializable(explicitToJson: true)
class UnifediApiAccessList extends IJsonObj {
  @HiveField(0)
  final List<UnifediApiAccess> instances;

  UnifediApiAccessList({
    required this.instances,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnifediApiAccessList &&
          runtimeType == other.runtimeType &&
          listEquals(instances, other.instances);

  @override
  int get hashCode => listHash(instances);

  @override
  String toString() {
    return 'UnifediApiAccessList{instances: $instances}';
  }

  static UnifediApiAccessList fromJson(Map<String, dynamic> json) =>
      _$UnifediApiAccessListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UnifediApiAccessListToJson(this);
}
