import 'dart:convert';

import 'package:fedi/mastodon/api/filter/mastodon_api_filter_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

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

  String toJsonString();
}

abstract class IPostPleromaApiFilter implements IPostMastodonApiFilter {
  Map<String, dynamic> toJson();

  String toJsonString();
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
@HiveType(typeId: -32 + 95)
class PleromaApiFilter extends IPleromaApiFilter {
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

  PleromaApiFilter({
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
      other is PleromaApiFilter &&
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

  factory PleromaApiFilter.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiFilterFromJson(json);

  factory PleromaApiFilter.fromJsonString(String jsonString) =>
      _$PleromaApiFilterFromJson(jsonDecode(jsonString));

  static List<PleromaApiFilter> listFromJsonString(String str) =>
      List<PleromaApiFilter>.from(
        json.decode(str).map((x) => PleromaApiFilter.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$PleromaApiFilterToJson(this);

  @override
  String toJsonString() => jsonEncode(_$PleromaApiFilterToJson(this));
}

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
)
class PostPleromaApiFilter extends IPostPleromaApiFilter {
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

  factory PostPleromaApiFilter.fromJson(Map<String, dynamic> json) =>
      _$PostPleromaApiFilterFromJson(json);

  factory PostPleromaApiFilter.fromJsonString(String jsonString) =>
      _$PostPleromaApiFilterFromJson(jsonDecode(jsonString));

  static List<PostPleromaApiFilter> listFromJsonString(String str) =>
      List<PostPleromaApiFilter>.from(
        json.decode(str).map((x) => PleromaApiFilter.fromJson(x)),
      );

  @override
  Map<String, dynamic> toJson() => _$PostPleromaApiFilterToJson(this);

  @override
  String toJsonString() => jsonEncode(_$PostPleromaApiFilterToJson(this));
}
