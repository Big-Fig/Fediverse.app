import 'dart:convert';

import 'package:fedi/refactored/mastodon/status/context/mastodon_status_context_model.dart';
import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_status_context_model.g.dart';

abstract class IPleromaStatusContext implements IMastodonStatusContext {
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
    this.descendants,
    this.ancestors,
  });

  factory PleromaStatusContext.fromJson(Map<String, dynamic> json) =>
      _$PleromaStatusContextFromJson(json);

  factory PleromaStatusContext.fromJsonString(String jsonString) =>
      _$PleromaStatusContextFromJson(jsonDecode(jsonString));

  Map<String, dynamic> toJson() => _$PleromaStatusContextToJson(this);
  String toJsonString() => jsonEncode(_$PleromaStatusContextToJson(this));

  @override
  String toString() {
    return 'PleromaStatusContext{descendants: $descendants, ancestors: $ancestors}';
  }
}
