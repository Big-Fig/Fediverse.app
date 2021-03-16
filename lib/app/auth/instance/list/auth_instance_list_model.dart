import 'dart:convert';

import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/json/json_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_instance_list_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 49)
@JsonSerializable(explicitToJson: true)
class AuthInstanceList extends IJsonObject {
  @HiveField(0)
  final List<AuthInstance?>? instances;

  AuthInstanceList({this.instances});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthInstanceList &&
          runtimeType == other.runtimeType &&
          instances == other.instances;

  @override
  int get hashCode => instances.hashCode;

  @override
  String toString() {
    return 'AuthInstanceList{instances: $instances}';
  }

  factory AuthInstanceList.fromJson(Map<String, dynamic> json) =>
      _$AuthInstanceListFromJson(json);

  factory AuthInstanceList.fromJsonString(String jsonString) =>
      _$AuthInstanceListFromJson(jsonDecode(jsonString));

  static List<AuthInstanceList> listFromJsonString(String str) =>
      List<AuthInstanceList>.from(
          json.decode(str).map((x) => AuthInstanceList.fromJson(x)));

  @override
  Map<String, dynamic> toJson() => _$AuthInstanceListToJson(this);

  String toJsonString() => jsonEncode(_$AuthInstanceListToJson(this));
}
