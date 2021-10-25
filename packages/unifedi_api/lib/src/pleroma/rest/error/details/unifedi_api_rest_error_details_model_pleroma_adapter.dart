import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pleroma_api/pleroma_api.dart';

import '../../../../api/rest/error/details/unifedi_api_rest_error_details_model.dart';
import '../type/unifedi_api_rest_error_type_sealed_pleroma_converter.dart';

part 'unifedi_api_rest_error_details_model_pleroma_adapter.freezed.dart';

part 'unifedi_api_rest_error_details_model_pleroma_adapter.g.dart';

@freezed
@HiveType(typeId: 0)
class UnifediApiRestErrorDetailsPleromaAdapter
    with _$UnifediApiRestErrorDetailsPleromaAdapter
    implements IUnifediApiRestErrorDetails {
  const UnifediApiRestErrorDetailsPleromaAdapter._();

  const factory UnifediApiRestErrorDetailsPleromaAdapter(
    @HiveField(0) PleromaApiRestErrorDetails value,
  ) = _UnifediApiRestErrorDetailsPleromaAdapter;

  factory UnifediApiRestErrorDetailsPleromaAdapter.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$UnifediApiRestErrorDetailsPleromaAdapterFromJson(json);

  @override
  Map<String, List<IUnifediApiRestErrorDetails>>? get details => null;

  @override
  // sometimes error is desc sometimes id

  // TODO: report to pleroma
  String get identifier =>
      value.identifierAsPleromaApi.toUnifediApiRestErrorType().stringValue;

  @override
  // sometimes error is desc sometimes id
  // TODO: report to pleroma
  String? get message => value.message ?? value.error;
}

extension PleromaApiRestErrorDetailsUnifediExtension
    on IPleromaApiRestErrorDetails {
  UnifediApiRestErrorDetailsPleromaAdapter
      toUnifediApiRestErrorDetailsPleromaAdapter() =>
          UnifediApiRestErrorDetailsPleromaAdapter(
            toPleromaApiRestErrorDetails(),
          );
}

extension UnifediApiRestErrorDetailsPleromaExtension
    on IUnifediApiRestErrorDetails {
  PleromaApiRestErrorDetails toPleromaApiRestErrorDetails() =>
      PleromaApiRestErrorDetails(
        identifier:
            identifierAsUnifediApi.toPleromaApiRestErrorType().stringValue,
        message: message,
        error: null,
      );
}
