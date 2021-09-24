import 'package:fedi/app/hive/old/auth_instance_model.dart';
import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';

// ignore_for_file: no-magic-number
part 'auth_instance_list_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 49)
@JsonSerializable(explicitToJson: true)
class AuthInstanceList implements IJsonObj {
  @HiveField(0)
  final List<AuthInstance> instances;

  AuthInstanceList({
    required this.instances,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthInstanceList &&
          runtimeType == other.runtimeType &&
          listEquals(instances, other.instances);

  @override
  int get hashCode => listHash(instances);

  @override
  String toString() {
    return 'AuthInstanceList{instances: $instances}';
  }

  static AuthInstanceList fromJson(Map<String, dynamic> json) =>
      _$AuthInstanceListFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthInstanceListToJson(this);
}
