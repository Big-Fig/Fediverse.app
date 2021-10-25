import 'package:fedi_app/app/hive/old/auth_instance_old_model.dart';

import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'auth_instance_list_old_model.g.dart';
part 'auth_instance_list_old_model.freezed.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 49)
@freezed
class AuthInstanceListOld with _$AuthInstanceListOld implements IJsonObj {
  const factory AuthInstanceListOld({
    @HiveField(0) required List<AuthInstanceOld> instances,
  }) = _AuthInstanceListOld;

  factory AuthInstanceListOld.fromJson(Map<String, dynamic> json) =>
      _$AuthInstanceListOldFromJson(json);
}
