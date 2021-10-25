import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_list_model.dart';

// ignore_for_file: no-magic-number

part 'mastodon_api_list_model_impl.freezed.dart';

part 'mastodon_api_list_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiList with _$MastodonApiList implements IMastodonApiList {
  const factory MastodonApiList({
    @HiveField(0) required String id,
    @HiveField(1) required String title,
    @JsonKey(name: 'replies_policy')
    @HiveField(2)
        required String? repliesPolicy,
  }) = _MastodonApiList;

  factory MastodonApiList.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiListFromJson(json);
}

extension MastodonApiListInterfaceExtension on IMastodonApiList {
  MastodonApiList toMastodonApiList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiList(
          id: id,
          title: title,
          repliesPolicy: repliesPolicy,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiListInterfaceListExtension on List<IMastodonApiList> {
  List<MastodonApiList> toMastodonApiListList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiList item) => item.toMastodonApiList(),
        forceNewObject: forceNewObject,
      );
}
