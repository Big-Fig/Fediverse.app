import 'dart:convert';

import 'package:fedi/mastodon/application/mastodon_application_model.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_application_model.g.dart';

abstract class IPleromaApplication implements IMastodonApplication {}

@JsonSerializable()
@MastodonApplicationNameTypeConverter()
class PleromaApplication implements IPleromaApplication {
  final MastodonApplicationName name;
  final dynamic website;
  @JsonKey(name: "vapid_key")
  final String vapidKey;

  PleromaApplication({this.name, this.website, this.vapidKey});

  PleromaApplication.allRequired(
      {@required this.name, @required this.website, @required this.vapidKey});

  factory PleromaApplication.fromJson(Map<String, dynamic> json) =>
      _$PleromaApplicationFromJson(json);

  factory PleromaApplication.fromJsonString(String jsonString) =>
      _$PleromaApplicationFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaApplicationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApplicationToJson(this));
  @override
  String toString() {
    return 'PleromaApplication{name: $name, website: $website, vapidKey: $vapidKey}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApplication &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          website == other.website &&
          vapidKey == other.vapidKey;
  @override
  int get hashCode => name.hashCode ^ website.hashCode ^ vapidKey.hashCode;
}
