import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:http/http.dart';

abstract class IPleromaApiRestService implements IRestService, IPleromaApi {
  void processEmptyResponse<T>(
    Response response,
  );

  Future<List<T>> processJsonListResponse<T>(
    Response response,
    ResponseJsonParser<T> responseJsonParser,
  );

  Future<T> processJsonSingleResponse<T>(
    Response response,
    ResponseJsonParser<T> responseJsonParser, {
    bool parseInIsolate = true,
  });

  String processStringResponse(
    Response response,
  );

  Future<List<String>> processStringListResponse(
    Response response,
  );
}
