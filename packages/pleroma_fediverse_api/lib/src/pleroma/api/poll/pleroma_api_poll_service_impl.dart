import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/poll/pleroma_api_poll_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:base_fediverse_api/base_fediverse_api.dart';
import 'package:path/path.dart';

class PleromaApiPollService extends BasePleromaApiService
    implements IPleromaApiPollService {
  final pollRelativeUrlPath = '/api/v1/polls/';

  PleromaApiPollService({
    required IPleromaApiRestService restService,
  }) : super(
          restService: restService,
        );

  @override
  Future<IPleromaApiPoll> getPoll({
    required String pollRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(
        pollRelativeUrlPath,
        pollRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiPoll.fromJson,
    );
  }

  @override
  Future<IPleromaApiPoll> vote({
    required String pollRemoteId,
    required List<int> voteIndexes,
  }) async {
    var request = RestRequest.post(
      relativePath: join(pollRelativeUrlPath, pollRemoteId, 'votes'),
      bodyJson: {'choices': voteIndexes},
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return restService.processJsonSingleResponse(
      httpResponse,
      PleromaApiPoll.fromJson,
    );
  }
}
