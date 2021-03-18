import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_exception.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaFilterService extends DisposableOwner
    implements IPleromaFilterService {
  final filterRelativeUrlPath = "/api/v1/filters";
  @override
  final IPleromaRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState? get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaFilterService({required this.restService});

  IPleromaFilter parseFilterResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaFilter.fromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaFilterException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaFilter> parseFilterListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaFilter.listFromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaFilterException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<List<IPleromaFilter>> getFilters({
    IPleromaPaginationRequest? pagination,
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
  Future<IPleromaFilter> getFilter({
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
  Future<IPleromaFilter> createFilter({
    required IPostPleromaFilter postPleromaFilter,
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
  Future<IPleromaFilter> updateFilter({
    required String? filterRemoteId,
    required IPostPleromaFilter postPleromaFilter,
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
          IPostPleromaFilter postPleromaFilter) =>
      postPleromaFilter.toJson();
}
