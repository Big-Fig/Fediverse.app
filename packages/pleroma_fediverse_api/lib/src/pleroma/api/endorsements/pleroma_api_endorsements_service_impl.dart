import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/endorsements/pleroma_api_endorsements_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiEndorsementsService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiEndorsementsService {
  final endorsementsRelativeUrlPath = '/api/v1/endorsements';

  @override
  final IPleromaApiAuthRestService restApiAuthService;

  PleromaApiEndorsementsService({
    required this.restApiAuthService,
  }) : super(restService: restApiAuthService);

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
