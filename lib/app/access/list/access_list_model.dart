import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:unifedi_api/unifedi_api.dart';

part 'access_list_model.freezed.dart';

// ignore_for_file: no-magic-number
part 'access_list_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 115)
@freezed
class UnifediApiAccessList with _$UnifediApiAccessList implements IJsonObj {
  const factory UnifediApiAccessList({
    @HiveField(0) required List<UnifediApiAccess> instances,
  }) = _UnifediApiAccessList;

  factory UnifediApiAccessList.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiAccessListFromJson(json);
}
