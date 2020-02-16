
import 'dart:convert';

import 'package:fedi/mastodon/application/mastodon_application_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_application_model.g.dart';

abstract class IPleromaApplication implements IMastodonApplication {
  
}

@JsonSerializable()
@MastodonApplicationNameTypeConverter()
class PleromaApplication implements IPleromaApplication {
  final MastodonApplicationName name;
  final dynamic website;

  PleromaApplication({
    this.name,
    this.website,
  });

  factory PleromaApplication.fromJson(Map<String, dynamic> json) =>
      _$PleromaApplicationFromJson(json);

  factory PleromaApplication.fromJsonString(String jsonString) =>
      _$PleromaApplicationFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaApplicationToJson(this);

  String toJsonString() => jsonEncode(_$PleromaApplicationToJson(this));
}
