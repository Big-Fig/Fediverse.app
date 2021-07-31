import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/poll/pleroma_api_poll_model.dart';

abstract class IPleromaApiPollService extends IPleromaApi {
  Future<IPleromaApiPoll> getPoll({
    required String pollRemoteId,
  });

  Future<IPleromaApiPoll> vote({
    required String pollRemoteId,
    required List<int> voteIndexes,
  });
}
