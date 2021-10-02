import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'my_account_old_model.g.dart';

part 'my_account_old_model.freezed.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: 0)
@freezed
class PleromaMyAccountWrapperOld
    with _$PleromaMyAccountWrapperOld
    implements IJsonObj {
  const PleromaMyAccountWrapperOld._();

  const factory PleromaMyAccountWrapperOld({
    @HiveField(0)
    @JsonKey(name: 'remote_account')
        required PleromaMyAccountWrapperOld pleromaAccount,
  }) = _PleromaMyAccountWrapperOld;

  factory PleromaMyAccountWrapperOld.fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountWrapperOldFromJson(json);
}
