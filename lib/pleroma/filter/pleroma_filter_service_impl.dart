import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_exception.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaFilterService implements IPleromaFilterService {
  final filterRelativeUrlPath = "/api/v1/filters";
  @override
  final IPleromaRestService restService;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

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

  PleromaFilterService({@required this.restService});

  IPleromaFilter parseFilterResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaFilter.fromJsonString(httpResponse.body);
    } else {
      throw PleromaFilterException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaFilter> parseFilterListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaFilter.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaFilterException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaFilter>> getFilters({
    String sinceId,
    String maxId,
    int limit = 20,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(filterRelativeUrlPath),
        queryArgs: [
          RestRequestQueryArg("since_id", sinceId),
          RestRequestQueryArg("max_id", maxId),
          RestRequestQueryArg("limit", limit?.toString()),
        ],
      ),
    );

    return parseFilterListResponse(httpResponse);
  }

  @override
  Future<IPleromaFilter> getFilter({@required String filterRemoteId}) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(filterRelativeUrlPath, filterRemoteId),
      ),
    );

    return parseFilterResponse(httpResponse);
  }

  @override
  Future deleteFilter({@required String filterRemoteId}) async {
    await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: urlPath.join(filterRelativeUrlPath, filterRemoteId),
      ),
    );
  }

  @override
  Future<IPleromaFilter> createFilter({
    @required IPleromaFilter filter,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(filterRelativeUrlPath),
        bodyJson: _mapFilterToFromBody(filter),
      ),
    );

    return parseFilterResponse(httpResponse);
  }

  @override
  Future<IPleromaFilter> updateFilter({
    @required String filterRemoteId,
    @required IPleromaFilter filter,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.put(
        relativePath: urlPath.join(filterRelativeUrlPath, filterRemoteId),
        bodyJson: _mapFilterToFromBody(filter),
      ),
    );

    return parseFilterResponse(httpResponse);
  }

  Map<String, dynamic> _mapFilterToFromBody(IPleromaFilter filter) {
    return {
      "phrase": filter.phrase,
      "context": filter.context,
      // it is not a bug expiresAt = expires_in
      if (filter.expiresAt != null) "expires_in": filter.expiresAt,
      if (filter.wholeWord != null) "whole_word": filter.wholeWord,
      if (filter.irreversible != null) "irreversible": filter.irreversible,
    };
  }

  @override
  Future dispose() async {
    // nothing
  }
}
