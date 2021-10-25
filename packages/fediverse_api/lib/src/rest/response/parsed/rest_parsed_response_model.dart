import '../rest_response_model.dart';

abstract class IParsedRestResponse<T> implements IRestResponse {
  T get result;
}
