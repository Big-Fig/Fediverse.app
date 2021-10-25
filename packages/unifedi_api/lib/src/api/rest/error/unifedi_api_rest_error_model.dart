import 'package:fediverse_api/fediverse_api_utils.dart';

import 'details/unifedi_api_rest_error_details_model.dart';

abstract class IUnifediApiRestError {
  IRestResponseError get restResponseError;

  IUnifediApiRestErrorDetails? get details;
}

extension IUnifediApiRestErrorExtension on IUnifediApiRestError {
  String? get descriptionOrContent {
    var message = details?.message;

    if (message == null && details?.identifier?.contains(' ') == true) {
      // todo: refactor
      // if identifier contains spaces it can be used as message
      message = details?.identifier;
    }

    return message ?? restResponseError.content;
  }
}
