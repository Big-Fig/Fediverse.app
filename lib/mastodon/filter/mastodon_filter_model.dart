import 'dart:convert';

import 'package:fedi/enum/enum_values.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor/moor.dart';

abstract class IBaseMastodonFilter {
  ///  The text to be filtered.
  String get phrase;

  ///  The contexts in which the filter should be applied.
  List<String> get context;

  List<MastodonFilterContextType> get contextMastodonType;

  /// Should matching entities in home and notifications be dropped by the server?
  bool get irreversible;

  /// Should the filter consider word boundaries?
  bool get wholeWord;
}

abstract class IMastodonFilter implements IBaseMastodonFilter {
  /// The ID of the filter in the database.
  String get id;

  /// When the filter should no longer be applied
  DateTime get expiresAt;
}

abstract class IPostMastodonFilter implements IBaseMastodonFilter {

  /// When the filter should no longer be applied
  int get expiresInSeconds;
}

enum MastodonFilterContextType {
  /// home timeline and lists
  homeAndCustomLists,

  /// notifications timeline
  notifications,

  /// public timelines
  public,

  /// expanded thread of a detailed status
  thread,
  /// account page
  account,

  /// new type which not recognized by Fedi yet
  unknown,
}

final _mastodonFilterContextTypeValues = EnumValues<MastodonFilterContextType>({
  "home": MastodonFilterContextType.homeAndCustomLists,
  "notifications": MastodonFilterContextType.notifications,
  "public": MastodonFilterContextType.public,
  "thread": MastodonFilterContextType.thread,
  "account": MastodonFilterContextType.account,
});

extension MastodonFilterContextTypeJsonValueExtension
    on MastodonFilterContextType {
  String toJsonValue() => _mastodonFilterContextTypeValues.enumToValueMap[this];
}

extension MastodonFilterContextTypeStringExtension on String {
  MastodonFilterContextType toMastodonFilterContextType() {
    if(this == null) {
      return null;
    }
    var contextType = _mastodonFilterContextTypeValues.valueToEnumMap[this];
    contextType ??= MastodonFilterContextType.unknown;
    return contextType;
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
      var jsonList = jsonDecode(fromDb) as List<dynamic>;

      return jsonList
          .map(
            (item) => item.toString().toMastodonFilterContextType(),
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
