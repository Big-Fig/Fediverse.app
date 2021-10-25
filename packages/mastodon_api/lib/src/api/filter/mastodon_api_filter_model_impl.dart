import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_filter_model.dart';

part 'mastodon_api_filter_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_filter_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiFilter with _$MastodonApiFilter implements IMastodonApiFilter {
  const factory MastodonApiFilter({
    @HiveField(0) required List<String> context,
    @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
    @HiveField(2) required String id,
    @HiveField(3) required bool irreversible,
    @HiveField(4) required String phrase,
    @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord,
  }) = _MastodonApiFilter;

  factory MastodonApiFilter.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiFilterFromJson(json);
}

extension MastodonApiFilterInterfaceExtension on IMastodonApiFilter {
  MastodonApiFilter toMastodonApiFilter({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiFilter(
          context: context,
          expiresAt: expiresAt,
          id: id,
          irreversible: irreversible,
          phrase: phrase,
          wholeWord: wholeWord,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiFilterInterfaceListExtension on List<IMastodonApiFilter> {
  List<MastodonApiFilter> toMastodonApiFilterList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiFilter item) => item.toMastodonApiFilter(),
        forceNewObject: forceNewObject,
      );
}
