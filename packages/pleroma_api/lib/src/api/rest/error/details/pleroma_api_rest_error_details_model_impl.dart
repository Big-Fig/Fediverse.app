import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'pleroma_api_rest_error_details_model.dart';

part 'pleroma_api_rest_error_details_model_impl.freezed.dart';

part 'pleroma_api_rest_error_details_model_impl.g.dart';

@freezed
class PleromaApiRestErrorDetails
    with _$PleromaApiRestErrorDetails
    implements IPleromaApiRestErrorDetails {
  const factory PleromaApiRestErrorDetails({
    required String? error,
    required String? identifier,
    required String? message,
  }) = _PleromaApiRestErrorDetails;

  factory PleromaApiRestErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$PleromaApiRestErrorDetailsFromJson(json);
}

extension IPleromaApiRestErrorDetailsInterfaceExtension
    on IPleromaApiRestErrorDetails {
  PleromaApiRestErrorDetails toPleromaApiRestErrorDetails({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => PleromaApiRestErrorDetails(
          error: error,
          identifier: identifier,
          message: message,
        ),
        forceNewObject: forceNewObject,
      );
}
