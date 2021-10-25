import '../rest_response_error_model.dart';

abstract class IRestResponseErrorException implements Exception {
  IRestResponseError get restResponseError;
}
