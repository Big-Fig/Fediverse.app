import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_filter_model.dart';

part 'unifedi_api_filter_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'unifedi_api_filter_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiFilter with _$UnifediApiFilter implements IUnifediApiFilter {
  const factory UnifediApiFilter({
    @HiveField(0) required List<String> context,
    @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
    @HiveField(2) required String id,
    @HiveField(3) required bool irreversible,
    @HiveField(4) required String phrase,
    @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord,
  }) = _UnifediApiFilter;

  factory UnifediApiFilter.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiFilterFromJson(json);
}

extension UnifediApiFilterInterfaceExtension on IUnifediApiFilter {
  UnifediApiFilter toUnifediApiFilter({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiFilter(
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

extension UnifediApiFilterInterfaceListExtension on List<IUnifediApiFilter> {
  List<UnifediApiFilter> toUnifediApiFilterList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IUnifediApiFilter item) => item.toUnifediApiFilter(),
        forceNewObject: forceNewObject,
      );
}
