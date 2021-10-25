import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_post_filter_model.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_post_filter_model_impl.freezed.dart';

part 'unifedi_api_post_filter_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiPostFilter
    with _$UnifediApiPostFilter
    implements IUnifediApiPostFilter {
  const factory UnifediApiPostFilter({
    @HiveField(0) required List<String> context,
    @HiveField(1) @JsonKey(name: 'expires_in') required Duration? expiresIn,
    @HiveField(3) required bool irreversible,
    @HiveField(4) required String phrase,
    @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord,
  }) = _UnifediApiPostFilter;

  factory UnifediApiPostFilter.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiPostFilterFromJson(json);
}

extension UnifediApiPostFilterInterfaceExtension on IUnifediApiPostFilter {
  UnifediApiPostFilter toUnifediApiPostFilter({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiPostFilter(
          context: context,
          expiresIn: expiresIn,
          irreversible: irreversible,
          phrase: phrase,
          wholeWord: wholeWord,
        ),
        forceNewObject: forceNewObject,
      );
}

extension UnifediApiPostFilterInterfaceListExtension
    on List<IUnifediApiPostFilter> {
  List<UnifediApiPostFilter> toUnifediApiPostFilterList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiPostFilter item) => item.toUnifediApiPostFilter(),
        forceNewObject: forceNewObject,
      );
}
