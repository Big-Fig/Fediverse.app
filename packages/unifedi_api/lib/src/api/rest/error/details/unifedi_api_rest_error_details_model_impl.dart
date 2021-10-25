import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'unifedi_api_rest_error_details_model.dart';

part 'unifedi_api_rest_error_details_model_impl.freezed.dart';

part 'unifedi_api_rest_error_details_model_impl.g.dart';

@freezed
class UnifediApiRestErrorDetails
    with _$UnifediApiRestErrorDetails
    implements IUnifediApiRestErrorDetails {
  const factory UnifediApiRestErrorDetails({
    required String? identifier,
    required String? message,
    required Map<String, List<UnifediApiRestErrorDetails>>? details,
  }) = _UnifediApiRestErrorDetails;

  factory UnifediApiRestErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$UnifediApiRestErrorDetailsFromJson(json);
}

extension IUnifediApiRestErrorDetailsInterfaceExtension
    on IUnifediApiRestErrorDetails {
  UnifediApiRestErrorDetails toUnifediApiRestErrorDetails({
    bool forceNewObject = false,
  }) =>
      InterfaceToImplHelper.interfaceToImpl(
        this,
        (_) => UnifediApiRestErrorDetails(
          identifier: identifier,
          message: message,
          details: details?.map(
            (key, value) => MapEntry(
              key,
              value
                  .map(
                    (e) => e.toUnifediApiRestErrorDetails(),
                  )
                  .toList(),
            ),
          ),
        ),
        forceNewObject: forceNewObject,
      );
}
