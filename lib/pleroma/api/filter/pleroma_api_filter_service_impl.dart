import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_exception.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_model.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaApiFilterService extends DisposableOwner
    implements IPleromaApiFilterService {
  final filterRelativeUrlPath = "/api/v1/filters";
  @override
  final IPleromaApiRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiFilterService({required this.restService});

  IPleromaApiFilter parseFilterResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiFilter.fromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaApiFilterException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaApiFilter> parseFilterListResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiFilter.listFromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaApiFilterException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<List<IPleromaApiFilter>> getFilters({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(filterRelativeUrlPath),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return parseFilterListResponse(httpResponse);
  }

  @override
  Future<IPleromaApiFilter> getFilter({
    required String? filterRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(
          filterRelativeUrlPath,
          filterRemoteId,
        ),
      ),
    );

    return parseFilterResponse(httpResponse);
  }

  @override
  Future deleteFilter({
    required String? filterRemoteId,
  }) async {
    await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: urlPath.join(
          filterRelativeUrlPath,
          filterRemoteId,
        ),
      ),
    );
  }

  @override
  Future<IPleromaApiFilter> createFilter({
    required IPostPleromaApiFilter postPleromaFilter,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          filterRelativeUrlPath,
        ),
        bodyJson: _mapFilterToFromBody(
          postPleromaFilter,
        ),
      ),
    );

    return parseFilterResponse(httpResponse);
  }

  @override
  Future<IPleromaApiFilter> updateFilter({
    required String? filterRemoteId,
    required IPostPleromaApiFilter postPleromaFilter,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.put(
        relativePath: urlPath.join(
          filterRelativeUrlPath,
          filterRemoteId,
        ),
        bodyJson: _mapFilterToFromBody(
          postPleromaFilter,
        ),
      ),
    );

    return parseFilterResponse(httpResponse);
  }

  Map<String, dynamic> _mapFilterToFromBody(
    IPostPleromaApiFilter postPleromaFilter,
  ) =>
      postPleromaFilter.toJson();
}
