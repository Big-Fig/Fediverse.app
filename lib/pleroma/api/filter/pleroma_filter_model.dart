import 'dart:convert';

import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// ignore_for_file: no-magic-number
part 'pleroma_filter_model.g.dart';

abstract class IPleromaFilter extends IMastodonApiFilter {
  IPleromaFilter copyWith({
    List<String> context,
    DateTime? expiresAt,
    String id,
    bool irreversible,
    String phrase,
    bool wholeWord,
  });

  Map<String, dynamic> toJson();

  String toJsonString();
}

abstract class IPostPleromaFilter implements IPostMastodonApiFilter {
  Map<String, dynamic> toJson();

  String toJsonString();
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
@HiveType(typeId: -32 + 95)
class PleromaFilter extends IPleromaFilter {
  @override
  @HiveField(0)
  final List<String> context;

  @override
  @HiveField(1)
  @JsonKey(name: "expires_at")
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
  @JsonKey(name: "whole_word")
  final bool wholeWord;

  PleromaFilter({
    required this.context,
    required this.phrase,
    required this.expiresAt,
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
      other is PleromaFilter &&
          runtimeType == other.runtimeType &&
          context == other.context &&
          expiresAt == other.expiresAt &&
          id == other.id &&
          irreversible == other.irreversible &&
          phrase == other.phrase &&
          wholeWord == other.wholeWord;

  @override
  int get hashCode =>
      context.hashCode ^
      expiresAt.hashCode ^
      id.hashCode ^
      irreversible.hashCode ^
      phrase.hashCode ^
      wholeWord.hashCode;

  @override
  String toString() {
    return 'PleromaFilter{'
        'context: $context, expiresAt: $expiresAt, id: $id, '
        'irreversible: $irreversible, phrase: $phrase, wholeWord: $wholeWord}';
  }

  @override
  PleromaFilter copyWith({
    List<String>? context,
    DateTime? expiresAt,
    String? id,
    bool? irreversible,
    String? phrase,
    bool? wholeWord,
  }) =>
      PleromaFilter(
        context: context ?? this.context,
        expiresAt: expiresAt ?? this.expiresAt,
        id: id ?? this.id,
        irreversible: irreversible ?? this.irreversible,
        phrase: phrase ?? this.phrase,
        wholeWord: wholeWord ?? this.wholeWord,
      );

  factory PleromaFilter.fromJson(Map<String, dynamic> json) =>
      _$PleromaFilterFromJson(json);

  factory PleromaFilter.fromJsonString(String jsonString) =>
      _$PleromaFilterFromJson(jsonDecode(jsonString));

  static List<PleromaFilter> listFromJsonString(String str) =>
      List<PleromaFilter>.from(
        json.decode(str).map((x) => PleromaFilter.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$PleromaFilterToJson(this);

  @override
  String toJsonString() => jsonEncode(_$PleromaFilterToJson(this));
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class PostPleromaFilter extends IPostPleromaFilter {
  @override
  final List<String> context;

  @override
  @JsonKey(name: "expires_in")
  final int? expiresInSeconds;

  @override
  final bool irreversible;

  @override
  final String phrase;

  @override
  @JsonKey(name: "whole_word")
  final bool wholeWord;

  PostPleromaFilter({
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
      other is PostPleromaFilter &&
          runtimeType == other.runtimeType &&
          context == other.context &&
          expiresInSeconds == other.expiresInSeconds &&
          irreversible == other.irreversible &&
          phrase == other.phrase &&
          wholeWord == other.wholeWord;

  @override
  int get hashCode =>
      context.hashCode ^
      expiresInSeconds.hashCode ^
      irreversible.hashCode ^
      phrase.hashCode ^
      wholeWord.hashCode;

  @override
  String toString() {
    return 'PostPleromaFilter{'
        'context: $context, '
        'expiresInSeconds: $expiresInSeconds, '
        'irreversible: $irreversible, '
        'phrase: $phrase, '
        'wholeWord: $wholeWord'
        '}';
  }

  PostPleromaFilter copyWith({
    List<String>? context,
    int? expiresInSeconds,
    bool? irreversible,
    String? phrase,
    bool? wholeWord,
  }) =>
      PostPleromaFilter(
        context: context ?? this.context,
        expiresInSeconds: expiresInSeconds ?? this.expiresInSeconds,
        irreversible: irreversible ?? this.irreversible,
        phrase: phrase ?? this.phrase,
        wholeWord: wholeWord ?? this.wholeWord,
      );

  factory PostPleromaFilter.fromJson(Map<String, dynamic> json) =>
      _$PostPleromaFilterFromJson(json);

  factory PostPleromaFilter.fromJsonString(String jsonString) =>
      _$PostPleromaFilterFromJson(jsonDecode(jsonString));

  static List<PostPleromaFilter> listFromJsonString(String str) =>
      List<PostPleromaFilter>.from(
        json.decode(str).map((x) => PleromaFilter.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$PostPleromaFilterToJson(this);

  @override
  String toJsonString() => jsonEncode(_$PostPleromaFilterToJson(this));
}
