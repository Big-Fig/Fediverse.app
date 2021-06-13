import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/endorsements/pleroma_api_endorsements_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiEndorsementsService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiEndorsementsService {
  final endorsementsRelativeUrlPath = '/api/v1/endorsements';

  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaApiEndorsementsService({
    required this.restService,
  }) : super(restService: restService);

  @override
  Future<List<IPleromaApiAccount>> getEndorsements({
    IMastodonApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          endorsementsRelativeUrlPath,
        ),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }
}
