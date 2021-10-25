import '../../feature/unifedi_api_feature_model.dart';
import '../../unifedi_api_service.dart';
import '../unifedi_api_poll_model.dart';

abstract class IUnifediApiPollService implements IUnifediApiService {
  IUnifediApiFeature get getPollFeature;

  Future<IUnifediApiPoll> getPoll({
    required String pollId,
  });

  IUnifediApiFeature get voteFeature;

  Future<IUnifediApiPoll> vote({
    required String pollId,
    required List<int> voteIndexes,
  });
}
