import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/mastodon/api/tag/mastodon_api_tag_model.dart';
import 'package:fedi/pleroma/api/tag/history/pleroma_api_tag_history_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_tag_model.g.dart';

abstract class IPleromaApiTag implements IMastodonApiTag {
  @override
  List<IPleromaApiTagHistory>? get history;
}

extension IPleromaApiTagExtension on IPleromaApiTag {
  PleromaApiTag toPleromaApiTag() {
    if (this is PleromaApiTag) {
      return this as PleromaApiTag;
    } else {
      return PleromaApiTag(
        name: name,
        url: url,
        history: history?.toPleromaApiTagHistories(),
      );
    }
  }
}

extension IPleromaApiTagListExtension on List<IPleromaApiTag> {
  List<PleromaApiTag> toPleromaApiTags() {
    if (this is List<PleromaApiTag>) {
      return this as List<PleromaApiTag>;
    } else {
      return map(
        (pleromaApiTag) => pleromaApiTag.toPleromaApiTag(),
      ).toList();
    }
  }
}

// -32 is hack for hive 0.x backward ids compatibility
// see reservedIds in Hive,
// which not exist in Hive 0.x
//@HiveType()
@HiveType(typeId: -32 + 74)
@JsonSerializable(explicitToJson: true)
class PleromaApiTag implements IPleromaApiTag {
  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String url;
  @override
  @HiveField(2)
  final List<PleromaApiTagHistory>? history;

  PleromaApiTag({
    required this.name,
    required this.url,
    required this.history,
  });

  PleromaApiTag.only({
    required this.name,
    required this.url,
    this.history,
  });

  static PleromaApiTag fromJson(Map<String, dynamic> json) =>
      _$PleromaApiTagFromJson(json);

  Map<String, dynamic> toJson() => _$PleromaApiTagToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiTag &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          url == other.url &&
          listEquals(history, other.history);

  @override
  int get hashCode => name.hashCode ^ url.hashCode ^ listHash(history);

  @override
  String toString() {
    return 'PleromaApiTag{'
        'name: $name, '
        'url: $url, '
        'history: $history'
        '}';
  }
}
