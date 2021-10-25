import '../request/rest_request_model.dart';

abstract class IRestResponse {
  IRestRequest get request;

  int get statusCode;

  String? get content;
}
