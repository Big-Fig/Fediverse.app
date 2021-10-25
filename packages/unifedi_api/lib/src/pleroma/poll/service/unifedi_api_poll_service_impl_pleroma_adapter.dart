import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/poll/service/unifedi_api_poll_service.dart';
import '../../../api/poll/unifedi_api_poll_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../unifedi_api_poll_model_pleroma_adapter.dart';

class UnifediApiPollServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter implements IUnifediApiPollService {
  final IPleromaApiPollUserAccessService pleromaApiPollUserAccessService;

  UnifediApiPollServicePleromaAdapter({
    required this.pleromaApiPollUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiPollUserAccessService.restService,
      );

  @override
  Future<IUnifediApiPoll> getPoll({
    required String pollId,
  }) =>
      pleromaApiPollUserAccessService
          .getPoll(
            pollId: pollId,
          )
          .then(
            (value) => value.toUnifediApiPollPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get getPollFeature =>
      pleromaApiPollUserAccessService.getPollFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiPoll> vote({
    required String pollId,
    required List<int> voteIndexes,
  }) =>
      pleromaApiPollUserAccessService
          .vote(
            pollId: pollId,
            voteIndexes: voteIndexes,
          )
          .then(
            (value) => value.toUnifediApiPollPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get voteFeature =>
      pleromaApiPollUserAccessService.voteFeature
          .toUnifediApiFeaturePleromaAdapter();
}
