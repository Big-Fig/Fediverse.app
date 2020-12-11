import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/search/pleroma_search_exception.dart';
import 'package:fedi/pleroma/search/pleroma_search_model.dart';
import 'package:fedi/pleroma/search/pleroma_search_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';

class PleromaSearchService implements IPleromaSearchService {
  @override
  final IPleromaAuthRestService restService;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

  PleromaSearchService({@required this.restService});

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  @override
  Future dispose() async {
    // nothing
  }

  @override
  Future<IPleromaSearchResult> search(
      {@required IPleromaSearchRequest request}) async {
    if (request.limit != null) {
      assert(request.limit <= 40, "Server-side limit");
    }

    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: "/api/v2/search",
        queryArgs: RestRequestQueryArg.listFromJson(request.toJson())));

    if (httpResponse.statusCode == 200) {
      return PleromaSearchResult.fromJsonString(httpResponse.body);
    } else {
      throw PleromaSearchException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }
}
