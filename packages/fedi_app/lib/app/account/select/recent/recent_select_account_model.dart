import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:unifedi_api/unifedi_api.dart';

// ignore_for_file: no-magic-number
part 'recent_select_account_model.g.dart';
part 'recent_select_account_model.freezed.dart';

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 93)
@freezed
class RecentSelectAccountList
    with _$RecentSelectAccountList
    implements IJsonObj {
  const factory RecentSelectAccountList({
    @JsonKey(name: 'recentItems')
    @HiveField(0)
        required List<UnifediApiAccount>? recentItems,
  }) = _RecentSelectAccountList;

  factory RecentSelectAccountList.fromJson(Map<String, dynamic> json) =>
      _$RecentSelectAccountListFromJson(json);
}
