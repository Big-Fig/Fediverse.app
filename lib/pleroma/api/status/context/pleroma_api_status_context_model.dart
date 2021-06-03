import 'package:fedi/collection/collection_hash_utils.dart';
import 'package:fedi/json/json_model.dart';
import 'package:fedi/mastodon/api/status/context/mastodon_api_status_context_model.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pleroma_api_status_context_model.g.dart';

abstract class IPleromaApiStatusContext implements IMastodonApiStatusContext {
  @override
  List<IPleromaApiStatus> get descendants;

  @override
  List<IPleromaApiStatus> get ancestors;
}

@JsonSerializable(explicitToJson: true)
class PleromaApiStatusContext implements IPleromaApiStatusContext, IJsonObject {
  @override
  final List<PleromaApiStatus> descendants;
  @override
  final List<PleromaApiStatus> ancestors;

  PleromaApiStatusContext({
    required this.descendants,
    required this.ancestors,
  });

  static PleromaApiStatusContext fromJson(Map<String, dynamic> json) =>
      _$PleromaApiStatusContextFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PleromaApiStatusContextToJson(this);

  @override
  String toString() {
    return 'PleromaApiStatusContext{'
        'descendants: $descendants, '
        'ancestors: $ancestors'
        '}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PleromaApiStatusContext &&
          runtimeType == other.runtimeType &&
          listEquals(descendants, other.descendants) &&
          listEquals(ancestors, other.ancestors);

  @override
  int get hashCode => listHash(descendants) ^ listHash(ancestors);
}
