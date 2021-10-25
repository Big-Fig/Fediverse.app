import 'package:mastodon_api/mastodon_api.dart';

import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../pleroma_api_poll_model.dart';
import '../../../pleroma_api_poll_model_impl.dart';
import 'pleroma_api_poll_public_access_service.dart';

class PleromaApiPollPublicAccessService extends PleromaApiService
    implements IPleromaApiPollPublicAccessService {
  final MastodonApiPollPublicAccessService mastodonApiPollPublicAccessService;

  PleromaApiPollPublicAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiPollPublicAccessService = MastodonApiPollPublicAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(
          restService: restService,
        );

  @override
  Future<IPleromaApiPoll> getPoll({
    required String pollId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getPollFeature,
        fieldFeatures: null,
        request: mastodonApiPollPublicAccessService.createGetPollRequest(
          pollId: pollId,
        ),
        jsonParser: (json) => PleromaApiPoll.fromJson(json),
      );

  @override
  IPleromaApiFeature get getPollFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiPollPublicAccessService.getPollFeature,
      );
}
