import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/pleroma/api/suggestions/pleroma_api_suggestions_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiSuggestionsService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiSuggestionsService {
  final suggestionsRelativeUrlPath = "/api/v1/suggestions";

  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaApiSuggestionsService({
    required this.restService,
  }) : super(restService: restService);

  @override
  Future<List<IPleromaApiAccount>> getSuggestions({
    required int limit,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          suggestionsRelativeUrlPath,
        ),
        queryArgs: [
          RestRequestQueryArg(
            key: "limit",
            value: limit.toString(),
          ),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }

  @override
  Future removeSuggestion({
    required String accountId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: _urlPath.join(
          suggestionsRelativeUrlPath,
          accountId,
        ),
      ),
    );

    restService.processEmptyResponse(
      httpResponse,
    );
  }
}
