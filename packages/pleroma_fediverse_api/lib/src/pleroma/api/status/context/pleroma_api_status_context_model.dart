import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/collection/collection_equal_utils.dart';
import 'package:pleroma_fediverse_api/src/collection/collection_hash_utils.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';

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
