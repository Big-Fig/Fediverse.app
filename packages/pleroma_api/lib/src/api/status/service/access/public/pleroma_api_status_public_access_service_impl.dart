import 'package:easy_dispose/easy_dispose.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../account/pleroma_api_account_model.dart';
import '../../../../account/pleroma_api_account_model_impl.dart';
import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../context/pleroma_api_status_context_model_impl.dart';
import '../../../emoji_reaction/pleroma_api_status_emoji_reaction_model.dart';
import '../../../emoji_reaction/pleroma_api_status_emoji_reaction_model_impl.dart';
import '../../../pleroma_api_status_model.dart';
import '../../../pleroma_api_status_model_impl.dart';
import 'pleroma_api_status_public_access_service.dart';

class PleromaApiStatusPublicAccessService extends PleromaApiService
    implements IPleromaApiStatusPublicAccessService {
  final statusesRelativeUrlPath = '/api/v1/statuses/';
  final pleromaStatusesRelativeUrlPath = '/api/v1/pleroma/statuses/';
  final reactionsRelativeUrlPath = 'reactions';

  final MastodonApiStatusPublicAccessService
      mastodonApiStatusPublicAccessService;

  PleromaApiStatusPublicAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiStatusPublicAccessService =
            MastodonApiStatusPublicAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        ) {
    mastodonApiStatusPublicAccessService.disposeWith(this);
  }

  @override
  Future<IPleromaApiStatus> getStatus({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getStatusFeature,
        fieldFeatures: null,
        request: mastodonApiStatusPublicAccessService.createGetStatusRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<List<IPleromaApiStatus>> getStatuses({
    required List<String> statusIds,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getStatusesFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              statusesRelativeUrlPath,
            ],
          ),
          queryArgs: statusIds
              .map(
                (id) => UrlQueryArg(
                  key: 'ids[]',
                  value: id,
                ),
              )
              .toList(),
        ),
        jsonParser: (json) => PleromaApiStatus.fromJson(json),
      );

  @override
  Future<PleromaApiStatusContext> getStatusContext({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getStatusContextFeature,
        fieldFeatures: null,
        request:
            mastodonApiStatusPublicAccessService.createGetStatusContextRequest(
          statusId: statusId,
        ),
        jsonParser: (json) => PleromaApiStatusContext.fromJson(json),
      );

  @override
  Future<List<IPleromaApiAccount>> favouritedBy({
    required String statusId,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: favouritedByFeature,
        fieldFeatures: null,
        request: mastodonApiStatusPublicAccessService.createFavouritedByRequest(
          statusId: statusId,
          pagination: pagination,
        ),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  Future<List<IPleromaApiAccount>> rebloggedBy({
    required String statusId,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: rebloggedByFeature,
        fieldFeatures: null,
        request: mastodonApiStatusPublicAccessService.createRebloggedByRequest(
          statusId: statusId,
          pagination: pagination,
        ),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  IPleromaApiFeature get favouritedByFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiStatusPublicAccessService.favouritedByFeature,
      );

  @override
  IPleromaApiFeature get getStatusContextFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiStatusPublicAccessService.getStatusContextFeature,
      );

  @override
  IPleromaApiFeature get getStatusFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiStatusPublicAccessService.getStatusFeature,
      );

  @override
  IPleromaApiFeature get getStatusesFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiStatusPublicAccessService.getStatusFeature,
      );

  @override
  IPleromaApiFeature get rebloggedByFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        mastodonApiStatusPublicAccessService.rebloggedByFeature,
      );

  @override
  Future<IPleromaApiStatusEmojiReaction> getEmojiReaction({
    required String statusId,
    required String emoji,
  }) async {
    // pleroma returns array even when we specify emoji
    var listResponse = await restService.sendHttpRequestAndParseJsonList(
      requestFeature: getEmojiReactionFeature,
      fieldFeatures: null,
      request: RestRequest.get(
        relativePath: UrlPathHelper.join(
          [
            pleromaStatusesRelativeUrlPath,
            statusId,
            reactionsRelativeUrlPath,
            emoji,
          ],
        ),
      ),
      jsonParser: (json) => PleromaApiStatusEmojiReaction.fromJson(json),
    );

    return listResponse.first;
  }

  @override
  Future<List<IPleromaApiStatusEmojiReaction>> getEmojiReactions({
    required String statusId,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getEmojiReactionsFeature,
        fieldFeatures: null,
        request: RestRequest.get(
          relativePath: UrlPathHelper.join(
            [
              pleromaStatusesRelativeUrlPath,
              statusId,
              reactionsRelativeUrlPath,
            ],
          ),
        ),
        jsonParser: (json) => PleromaApiStatusEmojiReaction.fromJson(json),
      );

  @override
  IPleromaApiFeature get getEmojiReactionFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        null,
      );

  @override
  IPleromaApiFeature get getEmojiReactionsFeature =>
      PleromaApiFeature.onlyPublicRequirements(
        null,
      );
}
