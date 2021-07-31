import 'package:mastodon_fediverse_api/mastodon_fediverse_api.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/featured_tags/pleroma_api_featured_tags_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/featured_tags/pleroma_api_featured_tags_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/tag/pleroma_api_tag_model.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart' as path;

var _urlPath = path.Context(style: path.Style.url);

class PleromaApiFeaturedTagsService extends BasePleromaApiService
    with PleromaApiAuthMixinService
    implements IPleromaApiFeaturedTagsService {
  final featuredTagsRelativeUrlPath = '/api/v1/featured_tags';

  @override
  final IPleromaApiAuthRestService restApiAuthService;

  PleromaApiFeaturedTagsService({
    required this.restApiAuthService,
  }) : super(restService: restApiAuthService);

  @override
  Future<List<IPleromaApiFeaturedTag>> getFeaturedTags({
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
      PleromaApiFeaturedTag.fromJson,
    );
  }

  @override
  Future<List<IPleromaApiTag>> getSuggestedTags() async {
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
      PleromaApiTag.fromJson,
    );
  }

  @override
  Future<IPleromaApiFeaturedTag> featureTag({
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
      PleromaApiFeaturedTag.fromJson,
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
