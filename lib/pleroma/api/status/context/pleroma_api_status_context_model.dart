import 'dart:convert';

import 'package:fedi/mastodon/api/status/context/mastodon_api_status_context_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_status_context_model.g.dart';

abstract class IPleromaStatusContext implements IMastodonApiStatusContext {
  @override
  List<IPleromaStatus> get descendants;

  @override
  List<IPleromaStatus> get ancestors;
}

@JsonSerializable()
class PleromaStatusContext implements IPleromaStatusContext {
  @override
  final List<PleromaStatus> descendants;
  @override
  final List<PleromaStatus> ancestors;

  PleromaStatusContext({
    required this.descendants,
    required this.ancestors,
  });

  factory PleromaStatusContext.fromJson(Map<String, dynamic> json) =>
      _$PleromaStatusContextFromJson(json);

  factory PleromaStatusContext.fromJsonString(String jsonString) =>
      _$PleromaStatusContextFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaStatusContextToJson(this);

  String toJsonString() => jsonEncode(_$PleromaStatusContextToJson(this));

  @override
  String toString() {
    return 'PleromaStatusContext{'
        'descendants: $descendants, '
        'ancestors: $ancestors'
        '}';
  }
}
