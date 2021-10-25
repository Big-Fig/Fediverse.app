import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/instance/urls/unifedi_api_instance_urls_model.dart';

part 'unifedi_api_instance_urls_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_instance_urls_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiInstanceUrlsPleromaAdapter
    with _$UnifediApiInstanceUrlsPleromaAdapter
    implements IUnifediApiInstanceUrls {
  const UnifediApiInstanceUrlsPleromaAdapter._();

  const factory UnifediApiInstanceUrlsPleromaAdapter(
    @HiveField(0) PleromaApiInstanceUrls value,
  ) = _UnifediApiInstanceUrlsPleromaAdapter;

  @override
  String? get streamingApi => value.streamingApi;

  factory UnifediApiInstanceUrlsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiInstanceUrlsPleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension on IPleromaApiInstanceUrls {
  UnifediApiInstanceUrlsPleromaAdapter
      toUnifediApiInstanceUrlsPleromaAdapter() =>
          UnifediApiInstanceUrlsPleromaAdapter(
            toPleromaApiInstanceUrls(),
          );
}

extension UnifediApiInstanceUrlsPleromaExtension on IUnifediApiInstanceUrls {
  PleromaApiInstanceUrls toPleromaApiInstanceUrls() => PleromaApiInstanceUrls(
        streamingApi: streamingApi,
      );
}
