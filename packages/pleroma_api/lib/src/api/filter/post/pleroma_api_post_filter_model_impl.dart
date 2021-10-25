import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_post_filter_model.dart';

// ignore_for_file: no-magic-number
part 'pleroma_api_post_filter_model_impl.freezed.dart';

part 'pleroma_api_post_filter_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiPostFilter
    with _$PleromaApiPostFilter
    implements IPleromaApiPostFilter {
  const factory PleromaApiPostFilter({
    @HiveField(0) required List<String> context,
    @HiveField(1) @JsonKey(name: 'expires_in') required Duration? expiresIn,
    @HiveField(3) required bool irreversible,
    @HiveField(4) required String phrase,
    @HiveField(5) @JsonKey(name: 'whole_word') required bool wholeWord,
  }) = _PleromaApiPostFilter;

  factory PleromaApiPostFilter.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiPostFilterFromJson(json);
}

extension PleromaApiPostFilterInterfaceExtension on IPleromaApiPostFilter {
  PleromaApiPostFilter toPleromaApiPostFilter({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiPostFilter(
          context: context,
          expiresIn: expiresIn,
          irreversible: irreversible,
          phrase: phrase,
          wholeWord: wholeWord,
        ),
        forceNewObject: forceNewObject,
      );
}

extension PleromaApiPostFilterInterfaceListExtension
    on List<IPleromaApiPostFilter> {
  List<PleromaApiPostFilter> toPleromaApiPostFilterList({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceListToImplList(
        this,
        (IPleromaApiPostFilter item) => item.toPleromaApiPostFilter(),
        forceNewObject: forceNewObject,
      );
}
