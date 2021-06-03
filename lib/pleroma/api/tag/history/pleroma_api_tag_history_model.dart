import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/history/mastodon_api_history_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_tag_history_model.g.dart';

abstract class IPleromaApiTagHistory extends IMastodonApiTagHistory {}

extension IPleromaApiTagHistoryExtension on IPleromaApiTagHistory {
  PleromaApiTagHistory toPleromaApiTagHistory() {
    if (this is PleromaApiTagHistory) {
      return this as PleromaApiTagHistory;
    } else {
      return PleromaApiTagHistory(
        accounts: accounts,
        dayInUnixTimestamp: dayInUnixTimestamp,
        uses: uses,
      );
    }
  }
}

extension IPleromaApiTagHistoryListExtension on List<IPleromaApiTagHistory> {
  List<PleromaApiTagHistory> toPleromaApiTagHistories() {
    if (this is List<PleromaApiTagHistory>) {
      return this as List<PleromaApiTagHistory>;
    } else {
      return map(
        (pleromaApiTagHistory) => pleromaApiTagHistory.toPleromaApiTagHistory(),
      ).toList();
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 77)
@JsonSerializable()
class PleromaApiTagHistory implements IPleromaApiTagHistory, IJsonObject {
  @override
  @HiveField(0)
  @JsonKey(fromJson: int.parse, toJson: _intToString)
  final int accounts;

  @override
  @HiveField(1)
  final int? dayInUnixTimestamp;

  @override
  @HiveField(2)
  @JsonKey(fromJson: int.parse, toJson: _intToString)
  final int uses;

  PleromaApiTagHistory({
    required this.accounts,
    required this.dayInUnixTimestamp,
    required this.uses,
  });

  static PleromaApiTagHistory fromJson(Map<String, dynamic> json) =>
      _$PleromaApiTagHistoryFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiTagHistoryToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiTagHistory &&
          runtimeType == other.runtimeType &&
          accounts == other.accounts &&
          dayInUnixTimestamp == other.dayInUnixTimestamp &&
          uses == other.uses;

  @override
  int get hashCode =>
      accounts.hashCode ^ dayInUnixTimestamp.hashCode ^ uses.hashCode;

  @override
  String toString() {
    return 'PleromaApiTagHistory{'
        'accounts: $accounts, '
        'dayInUnixTimestamp: $dayInUnixTimestamp, '
        'uses: $uses'
        '}';
  }

  static String _intToString(int val) => val.toString();
}
