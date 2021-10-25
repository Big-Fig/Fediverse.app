import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../mastodon_api_status_model_impl.dart';
import 'mastodon_api_status_context_model.dart';

part 'mastodon_api_status_context_model_impl.freezed.dart';

part 'mastodon_api_status_context_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiStatusContext
    with _$MastodonApiStatusContext
    implements IMastodonApiStatusContext {
  const factory MastodonApiStatusContext({
    @HiveField(0) required List<MastodonApiStatus> descendants,
    @HiveField(1) required List<MastodonApiStatus> ancestors,
  }) = _MastodonApiStatusContext;

  factory MastodonApiStatusContext.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MastodonApiStatusContextFromJson(json);
}

extension IMastodonApiStatusContextInterfaceExtension
    on IMastodonApiStatusContext {
  MastodonApiStatusContext toMastodonApiStatusContext({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiStatusContext(
          descendants: descendants.toMastodonApiStatusList(
            forceNewObject: forceNewObject,
          ),
          ancestors: ancestors.toMastodonApiStatusList(
            forceNewObject: forceNewObject,
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
