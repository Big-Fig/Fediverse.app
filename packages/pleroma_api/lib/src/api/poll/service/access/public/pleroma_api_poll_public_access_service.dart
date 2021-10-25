import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../pleroma_api_poll_model.dart';

abstract class IPleromaApiPollPublicAccessService extends IPleromaApiService {
  IPleromaApiFeature get getPollFeature;

  Future<IPleromaApiPoll> getPoll({
    required String pollId,
  });
}
