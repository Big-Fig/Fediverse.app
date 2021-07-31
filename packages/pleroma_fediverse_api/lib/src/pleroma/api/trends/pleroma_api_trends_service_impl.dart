import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/trends/pleroma_api_trends_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiTrendsService extends BasePleromaApiService
    implements IPleromaApiTrendsService {
  final trendsRelativeUrlPath = '/api/v1/trends';

  PleromaApiTrendsService({
    required IPleromaApiRestService restService,
  }) : super(restService: restService);

  @override
  Future<List<IPleromaApiTag>> getTrendingTags({
    // ignore: no-magic-number
    int? limit = 10,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          trendsRelativeUrlPath,
        ),
        queryArgs: [
          RestRequestQueryArg(
            key: 'limit',
            value: (limit ?? 10).toString(),
          ),
        ],
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaApiTag.fromJson,
    );
  }
}
