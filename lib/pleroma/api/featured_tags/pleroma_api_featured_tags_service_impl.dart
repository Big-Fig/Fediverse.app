import 'package:fedi/mastodon/api/pagination/mastodon_api_pagination_model.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_model.dart';
import 'package:fedi/pleroma/api/featured_tags/pleroma_api_featured_tags_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiFeaturedTagsService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiFeaturedTagsService {
  final featuredTagsRelativeUrlPath = '/api/v1/featured_tags';

  @override
  final IPleromaApiAuthRestService restService;

  @override
  IPleromaApiAuthRestService get restApiAuthService => restService;

  PleromaApiFeaturedTagsService({
    required this.restService,
  }) : super(restService: restService);

  @override
  Future<List<IPleromaFeaturedTag>> getFeaturedTags({
    IMastodonApiPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          featuredTagsRelativeUrlPath,
        ),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaFeaturedTag.fromJson,
    );
  }

  @override
  Future<List<IPleromaFeaturedTag>> getSuggestedTags() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: _urlPath.join(
          featuredTagsRelativeUrlPath,
          'suggestions',
        ),
      ),
    );

    return restService.processJsonListResponse(
      httpResponse,
      PleromaFeaturedTag.fromJson,
    );
  }

  @override
  Future<IPleromaFeaturedTag> featureTag({
    required String name,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: _urlPath.join(
          featuredTagsRelativeUrlPath,
        ),
        bodyJson: {
          'name': name,
        },
      ),
    );

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaFeaturedTag.fromJson,
    );
  }

  @override
  Future unFeatureTag({
    required String id,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: _urlPath.join(
          featuredTagsRelativeUrlPath,
          id,
        ),
      ),
    );

    restService.processEmptyResponse(
      httpResponse,
    );
  }
}
