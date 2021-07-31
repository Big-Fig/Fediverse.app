import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pleroma_fediverse_api/src/collection/collection_equal_utils.dart';
import 'package:pleroma_fediverse_api/src/collection/collection_hash_utils.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_filter_model.g.dart';

abstract class IPleromaApiFilter extends IMastodonApiFilter {
  IPleromaApiFilter copyWith({
    List<String> context,
    DateTime? expiresAt,
    String id,
    bool irreversible,
    String phrase,
    bool wholeWord,
  });

  Map<String, dynamic> toJson();
}

abstract class IPostPleromaApiFilter implements IPostMastodonApiFilter {
  Map<String, dynamic> toJson();
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
@HiveType(typeId: -32 + 100)
class PleromaApiFilter extends IPleromaApiFilter implements IJsonObject {
  @override
  @HiveField(0)
  final List<String> context;

  @override
  @HiveField(1)
  @JsonKey(name: 'expires_at')
  final DateTime? expiresAt;

  @override
  @HiveField(2)
  final String id;

  @override
  @HiveField(3)
  final bool irreversible;

  @override
  @HiveField(4)
  final String phrase;

  @override
  @HiveField(5)
  @JsonKey(name: 'whole_word')
  final bool wholeWord;

  PleromaApiFilter({
    required this.context,
    required this.phrase,
    required this.expiresAt,
    required this.id,
    required this.irreversible,
    required this.wholeWord,
  });

  PleromaApiFilter.only({
    required this.context,
    required this.phrase,
    this.expiresAt,
    required this.id,
    required this.irreversible,
    required this.wholeWord,
  });

  @override
  List<MastodonApiFilterContextType> get contextAsMastodonApiType =>
      context.toMastodonApiFilterContextTypes();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiFilter &&
          runtimeType == other.runtimeType &&
          listEquals(context, other.context) &&
          expiresAt == other.expiresAt &&
          id == other.id &&
          irreversible == other.irreversible &&
          phrase == other.phrase &&
          wholeWord == other.wholeWord;

  @override
  int get hashCode =>
      listHash(context) ^
      expiresAt.hashCode ^
      id.hashCode ^
      irreversible.hashCode ^
      phrase.hashCode ^
      wholeWord.hashCode;

  @override
  String toString() {
    return 'PleromaApiFilter{'
        'context: $context, '
        'expiresAt: $expiresAt, '
        'id: $id, '
        'irreversible: $irreversible, '
        'phrase: $phrase, '
        'wholeWord: $wholeWord'
        '}';
  }

  @override
  PleromaApiFilter copyWith({
    List<String>? context,
    DateTime? expiresAt,
    String? id,
    bool? irreversible,
    String? phrase,
    bool? wholeWord,
  }) =>
      PleromaApiFilter(
        context: context ?? this.context,
        expiresAt: expiresAt ?? this.expiresAt,
        id: id ?? this.id,
        irreversible: irreversible ?? this.irreversible,
        phrase: phrase ?? this.phrase,
        wholeWord: wholeWord ?? this.wholeWord,
      );

  static PleromaApiFilter fromJson(Map<String, dynamic> json) =>
      _$PleromaApiFilterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiFilterToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class PostPleromaApiFilter extends IPostPleromaApiFilter
    implements IJsonObject {
  @override
  final List<String> context;

  @override
  @JsonKey(name: 'expires_in')
  final int? expiresInSeconds;

  @override
  final bool irreversible;

  @override
  final String phrase;

  @override
  @JsonKey(name: 'whole_word')
  final bool wholeWord;

  PostPleromaApiFilter({
    required this.context,
    required this.phrase,
    required this.expiresInSeconds,
    required this.irreversible,
    required this.wholeWord,
  });

  @override
  List<MastodonApiFilterContextType> get contextAsMastodonApiType => context
      .map(
        (contextString) => contextString.toMastodonApiFilterContextType(),
      )
      .toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostPleromaApiFilter &&
          runtimeType == other.runtimeType &&
          listEquals(context, other.context) &&
          expiresInSeconds == other.expiresInSeconds &&
          irreversible == other.irreversible &&
          phrase == other.phrase &&
          wholeWord == other.wholeWord;

  @override
  int get hashCode =>
      listHash(context) ^
      expiresInSeconds.hashCode ^
      irreversible.hashCode ^
      phrase.hashCode ^
      wholeWord.hashCode;

  @override
  String toString() {
    return 'PostPleromaApiFilter{'
        'context: $context, '
        'expiresInSeconds: $expiresInSeconds, '
        'irreversible: $irreversible, '
        'phrase: $phrase, '
        'wholeWord: $wholeWord'
        '}';
  }

  PostPleromaApiFilter copyWith({
    List<String>? context,
    int? expiresInSeconds,
    bool? irreversible,
    String? phrase,
    bool? wholeWord,
  }) =>
      PostPleromaApiFilter(
        context: context ?? this.context,
        expiresInSeconds: expiresInSeconds ?? this.expiresInSeconds,
        irreversible: irreversible ?? this.irreversible,
        phrase: phrase ?? this.phrase,
        wholeWord: wholeWord ?? this.wholeWord,
      );

  static PostPleromaApiFilter fromJson(Map<String, dynamic> json) =>
      _$PostPleromaApiFilterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PostPleromaApiFilterToJson(this);
}
