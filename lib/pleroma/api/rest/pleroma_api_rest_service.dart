import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiRestService implements IRestService, IPleromaApi {
  static IPleromaApiRestService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiRestService>(
        context,
        listen: listen,
      );

  void processEmptyResponse<T>(
    Response response,
  );

  Future<List<T>> processJsonListResponse<T>(
    Response response,
    ResponseJsonParser<T> responseJsonParser,
  );

  Future<T> processJsonSingleResponse<T>(
    Response response,
    ResponseJsonParser<T> responseJsonParser,
  );

  String processStringResponse(
    Response response,
  );

  Future<List<String>> processStringListResponse(
    Response response,
  );
}
