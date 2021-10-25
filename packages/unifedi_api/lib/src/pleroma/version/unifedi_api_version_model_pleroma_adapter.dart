import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../api/version/unifedi_api_version_model.dart';

part 'unifedi_api_version_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_version_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiVersionPleromaAdapter
    with _$UnifediApiVersionPleromaAdapter
    implements IUnifediApiVersion {
  const UnifediApiVersionPleromaAdapter._();
  const factory UnifediApiVersionPleromaAdapter(
    @HiveField(0) PleromaApiVersion value,
  ) = _UnifediApiVersionPleromaAdapter;

  @override
  int? get buildNumber => value.buildNumber;

  @override
  String? get commit => value.commit;

  @override
  int get major => value.major;

  @override
  int? get minor => value.minor;

  @override
  int? get patch => value.patch;
  factory UnifediApiVersionPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiVersionPleromaAdapterFromJson(json);
}

extension PleromaApiFeatureUnifediExtension on IPleromaApiVersion {
  UnifediApiVersionPleromaAdapter toUnifediApiVersionPleromaAdapter() =>
      UnifediApiVersionPleromaAdapter(
        toPleromaApiVersion(),
      );
}
