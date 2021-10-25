import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_filter_model.dart';

part 'pleroma_api_filter_model_impl.freezed.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_filter_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiFilter with _$PleromaApiFilter implements IPleromaApiFilter {
  const factory PleromaApiFilter({
    @HiveField(0) required List<String> context,
    @HiveField(1) @JsonKey(name: 'expires_at') required DateTime? expiresAt,
    @HiveField(2) required String id,
    @HiveField(3) required bool irreversible,
    @HiveField(4) required String phrase,
    @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord,
  }) = _PleromaApiFilter;

  factory PleromaApiFilter.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiFilterFromJson(json);
}

extension PleromaApiFilterInterfaceExtension on IPleromaApiFilter {
  PleromaApiFilter toPleromaApiFilter({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiFilter(
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

extension PleromaApiFilterInterfaceListExtension on List<IPleromaApiFilter> {
  List<PleromaApiFilter> toPleromaApiFilterList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiFilter item) => item.toPleromaApiFilter(),
        forceNewObject: forceNewObject,
      );
}
