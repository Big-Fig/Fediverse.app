import 'dart:convert';

import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

abstract class IMastodonFilter {
  /// The ID of the filter in the database.
  String get id;

  ///  The text to be filtered.
  String get phrase;

  ///  The contexts in which the filter should be applied.
  List<String> get context;

  List<MastodonFilterContextType> get contextMastodonType;

  /// When the filter should no longer be applied
  DateTime get expiresAt;

  /// Should matching entities in home and notifications be dropped by the server?
  bool get irreversible;

  /// Should the filter consider word boundaries?
  bool get wholeWord;
}

enum MastodonFilterContextType {
  /// home timeline and lists
  home,

  /// notifications timeline
  notifications,

  /// public timelines
  public,

  /// expanded thread of a detailed status
  thread,
}

final _mastodonFilterContextTypeValues = EnumValues<MastodonFilterContextType>({
  "home": MastodonFilterContextType.home,
  "notifications": MastodonFilterContextType.notifications,
  "public": MastodonFilterContextType.public,
  "thread": MastodonFilterContextType.thread,
});

extension MastodonFilterContextTypeJsonValueExtension
    on MastodonFilterContextType {
  String toJsonValue() => _mastodonFilterContextTypeValues.enumToValueMap[this];
}

extension MastodonFilterContextTypeStringExtension on String {
  MastodonFilterContextType toMastodonFilterContextType() {
    var visibility = _mastodonFilterContextTypeValues.valueToEnumMap[this];
    assert(visibility != null, "invalid visibility $this");
    return visibility;
  }
}

class MastodonFilterContextTypeTypeConverter
    implements JsonConverter<MastodonFilterContextType, String> {
  const MastodonFilterContextTypeTypeConverter();

  @override
  MastodonFilterContextType fromJson(String value) =>
      value.toMastodonFilterContextType();

  @override
  String toJson(MastodonFilterContextType value) => value.toJsonValue();
}

class MastodonFilterContextTypeListTypeConverter
    extends TypeConverter<List<MastodonFilterContextType>, String> {
  const MastodonFilterContextTypeListTypeConverter() : super();

  @override
  List<MastodonFilterContextType> mapToDart(String fromDb) {
    if (fromDb?.isNotEmpty == true) {
      var jsonList = jsonDecode(fromDb) as List<String>;

      return jsonList
          .map(
            (item) => item.toMastodonFilterContextType(),
          )
          .toList();
    } else {
      return [];
    }
  }

  @override
  String mapToSql(List<MastodonFilterContextType> value) {
    if (value?.isNotEmpty == true) {
      return jsonEncode(value
          .map(
            (item) => item.toJsonValue(),
          )
          .toList());
    } else {
      return null;
    }
  }
}
