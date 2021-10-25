import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'mastodon_api_post_filter_model.dart';

// ignore_for_file: no-magic-number
part 'mastodon_api_post_filter_model_impl.freezed.dart';

part 'mastodon_api_post_filter_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class MastodonApiPostFilter
    with _$MastodonApiPostFilter
    implements IMastodonApiPostFilter {
  const factory MastodonApiPostFilter({
    @HiveField(0) required List<String> context,
    @HiveField(1) @JsonKey(name: 'expires_in') required Duration? expiresIn,
    @HiveField(3) required bool irreversible,
    @HiveField(4) required String phrase,
    @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord,
  }) = _MastodonApiPostFilter;

  factory MastodonApiPostFilter.fromJson(Map<String, dynamic> json) =>
      _$MastodonApiPostFilterFromJson(json);
}

extension MastodonApiPostFilterInterfaceExtension on IMastodonApiPostFilter {
  MastodonApiPostFilter toMastodonApiPostFilter({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => MastodonApiPostFilter(
          context: context,
          expiresIn: expiresIn,
          irreversible: irreversible,
          phrase: phrase,
          wholeWord: wholeWord,
        ),
        forceNewObject: forceNewObject,
      );
}

extension MastodonApiPostFilterInterfaceListExtension
    on List<IMastodonApiPostFilter> {
  List<MastodonApiPostFilter> toMastodonApiPostFilterList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IMastodonApiPostFilter item) => item.toMastodonApiPostFilter(),
        forceNewObject: forceNewObject,
      );
}
