import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pleroma_api/pleroma_api.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
// ignore_for_file: no-magic-number
part 'my_account_model.g.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: 0)
@JsonSerializable(explicitToJson: true)
class PleromaMyAccountWrapper implements IJsonObj {
  @HiveField(0)
  @JsonKey(name: 'remote_account')
  final PleromaApiMyAccount pleromaAccount;

  PleromaMyAccountWrapper({
    required this.pleromaAccount,
  });

  @override
  String toString() {
    return 'PleromaMyAccountWrapper{pleromaAccount: $pleromaAccount}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaMyAccountWrapper &&
          runtimeType == other.runtimeType &&
          pleromaAccount == other.pleromaAccount;

  @override
  int get hashCode => pleromaAccount.hashCode;

  static PleromaMyAccountWrapper fromJson(Map<String, dynamic> json) =>
      _$PleromaMyAccountWrapperFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaMyAccountWrapperToJson(this);
}
