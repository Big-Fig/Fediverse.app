import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'unifedi_api_instance_urls_model.dart';

// ignore_for_file: no-magic-number

part 'unifedi_api_instance_urls_model_impl.freezed.dart';

part 'unifedi_api_instance_urls_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class UnifediApiInstanceUrls
    with _$UnifediApiInstanceUrls
    implements IUnifediApiInstanceUrls {
  const factory UnifediApiInstanceUrls({
    @JsonKey(name: 'streaming_api') @HiveField(0) required String? streamingApi,
  }) = _UnifediApiInstanceUrls;

  factory UnifediApiInstanceUrls.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiInstanceUrlsFromJson(json);
}

extension UnifediApiInstanceUrlsInterfaceExtension on IUnifediApiInstanceUrls {
  UnifediApiInstanceUrls toUnifediApiInstanceUrls({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiInstanceUrls(
          streamingApi: streamingApi,
        ),
        forceNewObject: forceNewObject,
      );
}
