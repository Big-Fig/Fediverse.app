import 'package:fedi/pleroma/api/filter/pleroma_api_filter_model.dart';
import 'package:fedi/pleroma/api/filter/pleroma_api_filter_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiFilterService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiFilterService {
  final filterRelativeUrlPath = '/api/v1/filters';
  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaApiFilterService({
    required this.restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IPleromaApiFilter>> getFilters({
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(filterRelativeUrlPath),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiFilter.fromJson,
    );
  }

  @override
  Future<IPleromaApiFilter> getFilter({
    required String filterRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          filterRelativeUrlPath,
          filterRemoteId,
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiFilter.fromJson,
    );
  }

  @override
  Future deleteFilter({
    required String filterRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: _urlPath.join(
          filterRelativeUrlPath,
          filterRemoteId,
        ),
      ),
    );

    return restService.processEmptyResponse(httpResponse);
  }

  @override
  Future<IPleromaApiFilter> createFilter({
    required IPostPleromaApiFilter postPleromaFilter,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          filterRelativeUrlPath,
        ),
        bodyJson: postPleromaFilter.toJson(),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiFilter.fromJson,
    );
  }

  @override
  Future<IPleromaApiFilter> updateFilter({
    required String filterRemoteId,
    required IPostPleromaApiFilter postPleromaFilter,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.put(
        relativePath: _urlPath.join(
          filterRelativeUrlPath,
          filterRemoteId,
        ),
        bodyJson: postPleromaFilter.toJson(),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiFilter.fromJson,
    );
  }
}
