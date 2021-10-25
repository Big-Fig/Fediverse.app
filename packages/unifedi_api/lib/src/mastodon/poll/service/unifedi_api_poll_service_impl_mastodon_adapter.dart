import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/poll/service/unifedi_api_poll_service.dart';
import '../../../api/poll/unifedi_api_poll_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../unifedi_api_poll_model_mastodon_adapter.dart';

class UnifediApiPollServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter implements IUnifediApiPollService {
  final IMastodonApiPollUserAccessService mastodonApiPollUserAccessService;

  UnifediApiPollServiceMastodonAdapter({
    required this.mastodonApiPollUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService: mastodonApiPollUserAccessService.restService,
      );

  @override
  Future<IUnifediApiPoll> getPoll({
    required String pollId,
  }) =>
      mastodonApiPollUserAccessService
          .getPoll(
            pollId: pollId,
          )
          .then(
            (value) => value.toUnifediApiPollMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get getPollFeature =>
      mastodonApiPollUserAccessService.getPollFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiPoll> vote({
    required String pollId,
    required List<int> voteIndexes,
  }) =>
      mastodonApiPollUserAccessService
          .vote(
            pollId: pollId,
            voteIndexes: voteIndexes,
          )
          .then(
            (value) => value.toUnifediApiPollMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get voteFeature =>
      mastodonApiPollUserAccessService.voteFeature
          .toUnifediApiFeatureMastodonAdapter();
}
