import 'dart:convert';

import 'package:fedi/mastodon/api/history/mastodon_api_history_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_tag_history_model.g.dart';

abstract class IPleromaTagHistory extends IMastodonApiTagHistory {}

extension IPleromaTagHistoryExtension on IPleromaTagHistory {
  PleromaTagHistory toPleromaTagHistory() {
    if (this is PleromaTagHistory) {
      return this as PleromaTagHistory;
    } else {
      return PleromaTagHistory(
        accounts: accounts,
        dayInUnixTimestamp: dayInUnixTimestamp,
        uses: uses,
      );
    }
  }
}

extension IPleromaTagHistoryListExtension on List<IPleromaTagHistory> {
  List<PleromaTagHistory> toPleromaTagHistories() {
    if (this is List<PleromaTagHistory>) {
      return this as List<PleromaTagHistory>;
    } else {
      return map(
        (pleromaTagHistory) => pleromaTagHistory.toPleromaTagHistory(),
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
class PleromaTagHistory implements IPleromaTagHistory {
  @override
  @HiveField(0)
  // int(pleroma) or String(mastodon)
  final dynamic accounts;

  @override
  @HiveField(1)
  final int? dayInUnixTimestamp;

  @override
  @HiveField(2)
  // int(pleroma) or String(mastodon)
  final dynamic uses;

  PleromaTagHistory({
    required this.accounts,
    required this.dayInUnixTimestamp,
    required this.uses,
  });

  factory PleromaTagHistory.fromJson(Map<String, dynamic> json) =>
      _$PleromaTagHistoryFromJson(json);

  factory PleromaTagHistory.fromJsonString(String jsonString) =>
      _$PleromaTagHistoryFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaTagHistoryToJson(this);

  String toJsonString() => jsonEncode(_$PleromaTagHistoryToJson(this));
}
