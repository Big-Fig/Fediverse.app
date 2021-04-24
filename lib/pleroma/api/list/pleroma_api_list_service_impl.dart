import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_service.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiListService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiListService {
  final listRelativeUrlPath = "/api/v1/lists";
  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaApiListService({
    required this.restService,
  }) : super(restService: restService);

  @override
  Future<List<IPleromaApiList>> getLists() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          listRelativeUrlPath,
        ),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiList.fromJson,
    );
  }

  @override
  Future<IPleromaApiList> getList({
    required String listRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          listRelativeUrlPath,
          listRemoteId,
        ),
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiList.fromJson,
    );
  }

  @override
  Future deleteList({
    required String listRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: _urlPath.join(
          listRelativeUrlPath,
          listRemoteId,
        ),
      ),
    );

    return restService.processEmptyResponse(httpResponse);
  }

  @override
  Future<IPleromaApiList> createList({
    required String title,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          listRelativeUrlPath,
        ),
        bodyJson: {
          "title": title,
        },
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiList.fromJson,
    );
  }

  @override
  Future<IPleromaApiList> updateList({
    required String listRemoteId,
    required String title,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.put(
        relativePath: _urlPath.join(
          listRelativeUrlPath,
          listRemoteId,
        ),
        bodyJson: {
          "title": title,
        },
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiList.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiAccount>> getListAccounts({
    required String listRemoteId,
    IPleromaApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath:
            _urlPath.join(listRelativeUrlPath, listRemoteId, "accounts"),
        queryArgs: [
          ...(pagination?.toQueryArgs() ?? <RestRequestQueryArg>[]),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }

  @override
  Future addAccountsToList({
    required String listRemoteId,
    required List<String> accountIds,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          listRelativeUrlPath,
          listRemoteId,
          "accounts",
        ),
        bodyJson: {
          "account_ids": accountIds,
        },
      ),
    );
    return restService.processEmptyResponse(httpResponse);
  }

  @override
  Future removeAccountsFromList({
    required String listRemoteId,
    required List<String> accountIds,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: _urlPath.join(
          listRelativeUrlPath,
          listRemoteId,
          "accounts",
        ),
        bodyJson: {
          "account_ids": accountIds,
        },
      ),
    );

    return restService.processEmptyResponse(httpResponse);
  }
}
