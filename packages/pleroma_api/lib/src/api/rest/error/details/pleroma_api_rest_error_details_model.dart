import '../type/pleroma_api_rest_error_type_sealed.dart';

abstract class IPleromaApiRestErrorDetails {
  String? get error;

  String? get identifier;

  String? get message;
}

extension PleromaApiRestErrorDetailsExtension on IPleromaApiRestErrorDetails {
  PleromaApiRestErrorType get identifierAsPleromaApi =>
      PleromaApiRestErrorType.fromStringValue(
        identifier ?? error ?? '',
      );
}
