import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pleroma_api_instance_urls_model.dart';

// ignore_for_file: no-magic-number

part 'pleroma_api_instance_urls_model_impl.freezed.dart';

part 'pleroma_api_instance_urls_model_impl.g.dart';

@HiveType(typeId: 0)
@freezed
class PleromaApiInstanceUrls
    with _$PleromaApiInstanceUrls
    implements IPleromaApiInstanceUrls {
  const factory PleromaApiInstanceUrls({
    @JsonKey(name: 'streaming_api') @HiveField(0) required String? streamingApi,
  }) = _PleromaApiInstanceUrls;

  factory PleromaApiInstanceUrls.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiInstanceUrlsFromJson(json);
}

extension PleromaApiInstanceUrlsInterfaceExtension on IPleromaApiInstanceUrls {
  PleromaApiInstanceUrls toPleromaApiInstanceUrls({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiInstanceUrls(
          streamingApi: streamingApi,
        ),
        forceNewObject: forceNewObject,
      );
}
