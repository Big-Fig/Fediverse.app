import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../pleroma_api_poll_model.dart';
import '../../../pleroma_api_poll_model_impl.dart';
import '../public/pleroma_api_poll_public_access_service_impl.dart';
import 'pleroma_api_poll_user_access_service.dart';

class PleromaApiPollUserAccessService extends PleromaApiPollPublicAccessService
    implements IPleromaApiPollUserAccessService {
  final MastodonApiPollUserAccessService mastodonApiPollUserAccessService;

  PleromaApiPollUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiPollUserAccessService = MastodonApiPollUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        );

  @override
  Future<IPleromaApiPoll> vote({
    required String pollId,
    required List<int> voteIndexes,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: voteFeature,
        fieldFeatures: null,
        request: mastodonApiPollUserAccessService.createVoteRequest(
          pollId: pollId,
          voteIndexes: voteIndexes,
        ),
        jsonParser: (json) => PleromaApiPoll.fromJson(json),
      );

  @override
  IPleromaApiFeature get voteFeature => PleromaApiFeature.onlyUserRequirements(
        mastodonApiPollUserAccessService.voteFeature,
      );
}
