import 'package:fediverse_api/fediverse_api_utils.dart';

import '../../../../feature/mastodon_api_feature_model.dart';
import '../../../../feature/mastodon_api_feature_model_impl.dart';
import '../../../../requirement/access/scopes/mastodon_api_access_scopes_requirement_model_impl.dart';
import '../../../../requirement/instance/metadata/version/mastodon_api_instance_metadata_version_requirement_model_impl.dart';
import '../../../../rest/mastodon_api_rest_service.dart';
import '../../../../service/mastodon_api_service_impl.dart';
import '../../../mastodon_api_announcement_model.dart';
import '../../../mastodon_api_announcement_model_impl.dart';
import 'mastodon_api_announcement_user_access_service.dart';

class MastodonApiAnnouncementUserAccessService extends MastodonApiService
    implements IMastodonApiAnnouncementUserAccessService {
  final announcementRelativeUrlPath = '/api/v1/announcements';

  MastodonApiAnnouncementUserAccessService({
    required IMastodonApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<List<IMastodonApiAnnouncement>> getAnnouncements({
    required bool? withDismissed,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getAnnouncementsFeature,
        fieldFeatures: null,
        request: createGetAnnouncementsRequest(withDismissed: withDismissed),
        jsonParser: (json) => MastodonApiAnnouncement.fromJson(json),
      );

  RestRequest createGetAnnouncementsRequest({
    required bool? withDismissed,
  }) =>
      RestRequest.get(
        relativePath: announcementRelativeUrlPath,
        queryArgs: [
          if (withDismissed != null)
            UrlQueryArg(
              key: 'with_dismissed',
              value: withDismissed.toString(),
            ),
        ],
      );

  @override
  Future<void> dismissAnnouncement({
    required String announcementId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: dismissAnnouncementFeature,
        fieldFeatures: null,
        request: createDismissAnnouncementRequest(
          announcementId: announcementId,
        ),
      );

  RestRequest createDismissAnnouncementRequest({
    required String announcementId,
  }) =>
      RestRequest.post(
        relativePath: UrlPathHelper.join(
          [
            announcementRelativeUrlPath,
            announcementId,
            'dismiss',
          ],
        ),
      );

  @override
  Future<void> addAnnouncementReaction({
    required String announcementId,
    required String name,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: addAnnouncementReactionFeature,
        fieldFeatures: null,
        request: createAddAnnouncementReactionRequest(
          announcementId: announcementId,
          name: name,
        ),
      );

  RestRequest createAddAnnouncementReactionRequest({
    required String announcementId,
    required String name,
  }) =>
      RestRequest.put(
        relativePath: UrlPathHelper.join(
          [
            announcementRelativeUrlPath,
            announcementId,
            'reactions',
            name,
          ],
        ),
      );

  @override
  Future<void> removeAnnouncementReaction({
    required String announcementId,
    required String name,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: removeAnnouncementReactionFeature,
        fieldFeatures: null,
        request: createRemoveAnnouncementReactionRequest(
          announcementId: announcementId,
          name: name,
        ),
      );

  RestRequest createRemoveAnnouncementReactionRequest({
    required String announcementId,
    required String name,
  }) =>
      RestRequest.delete(
        relativePath: UrlPathHelper.join(
          [
            announcementRelativeUrlPath,
            announcementId,
            'reactions',
            name,
          ],
        ),
      );

  @override
  IMastodonApiFeature get addAnnouncementReactionFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFavourites,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_0,
      );

  @override
  IMastodonApiFeature get dismissAnnouncementFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeAccounts,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_0,
      );

  @override
  IMastodonApiFeature get getAnnouncementsFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_0,
      );

  @override
  IMastodonApiFeature get removeAnnouncementReactionFeature =>
      MastodonApiFeature.onlyUserRequirements.copyWith(
        accessScopesRequirement:
            MastodonApiAccessScopesRequirement.writeFavourites,
        instanceVersionRequirement:
            MastodonApiInstanceMetadataVersionRequirement.atLeast3_1_0,
      );
}
