import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../pleroma_api_poll_model.dart';
import '../public/pleroma_api_poll_public_access_service.dart';

abstract class IPleromaApiPollUserAccessService
    implements IPleromaApiPollPublicAccessService {
  IPleromaApiFeature get voteFeature;

  Future<IPleromaApiPoll> vote({
    required String pollId,
    required List<int> voteIndexes,
  });
}
