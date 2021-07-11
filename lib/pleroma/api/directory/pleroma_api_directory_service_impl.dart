import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/directory/pleroma_api_directory_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiDirectoryService extends BasePleromaApiService
    implements IPleromaApiDirectoryService {
  final directoryRelativeUrlPath = '/api/v1/directory';

  PleromaApiDirectoryService({
    required IPleromaApiRestService restService,
  }) : super(restService: restService);

  @override
  Future<List<IPleromaApiAccount>> getDirectoryAccounts({
    IMastodonApiPaginationRequest? pagination,
    bool? onlyLocal,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          directoryRelativeUrlPath,
        ),
        queryArgs: [
          if (onlyLocal != null)
            RestRequestQueryArg(
              key: 'local',
              value: onlyLocal.toString(),
            ),
          ...(pagination?.toQueryArgs() ?? []),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiAccount.fromJson,
    );
  }
}
