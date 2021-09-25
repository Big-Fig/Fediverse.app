import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pleroma_api/pleroma_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
// ignore_for_file: no-magic-number
part 'my_account_old_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class PleromaMyAccountWrapperOld implements IJsonObj {
  @HiveField(0)
  @JsonKey(name: 'remote_account')
  final PleromaApiMyAccount pleromaAccount;

  PleromaMyAccountWrapperOld({
    required this.pleromaAccount,
  });

  @override
  String toString() {
    return 'PleromaMyAccountWrapperOld{pleromaAccount: $pleromaAccount}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountWrapperOld &&
          runtimeType == other.runtimeType &&
          pleromaAccount == other.pleromaAccount;

  @override
  int get hashCode => pleromaAccount.hashCode;

  static PleromaMyAccountWrapperOld fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountWrapperOldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaMyAccountWrapperOldToJson(this);
}
