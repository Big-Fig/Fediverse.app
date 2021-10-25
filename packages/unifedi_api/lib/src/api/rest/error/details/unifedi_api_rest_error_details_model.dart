import '../type/unifedi_api_rest_error_type_sealed.dart';

abstract class IUnifediApiRestErrorDetails {
  String? get identifier;

  String? get message;

  Map<String, List<IUnifediApiRestErrorDetails>>? get details;
}

extension UnifediApiRestErrorDetailsExtension on IUnifediApiRestErrorDetails {
  UnifediApiRestErrorType get identifierAsUnifediApi =>
      UnifediApiRestErrorType.fromStringValue(
        identifier ?? '',
      );
}
