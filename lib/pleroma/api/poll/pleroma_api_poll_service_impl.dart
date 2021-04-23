import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_exception.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_model.dart';
import 'package:fedi/pleroma/api/poll/pleroma_api_poll_service.dart';
import 'package:fedi/pleroma/api/rest/auth/pleroma_api_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaApiPollService extends DisposableOwner
    implements IPleromaApiPollService {
  final pollRelativeUrlPath = "/api/v1/polls/";
  @override
  final IPleromaApiAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiPollService({required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<IPleromaApiPoll> getPoll({
    required String? pollRemoteId,
  }) async {
    var request = RestRequest.get(
      relativePath: join(
        pollRelativeUrlPath,
        pollRemoteId,
      ),
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parsePollResponse(httpResponse);
  }

  @override
  Future<IPleromaApiPoll> vote({
    required String? pollRemoteId,
    required List<int> voteIndexes,
  }) async {
    var request = RestRequest.post(
      relativePath: join(pollRelativeUrlPath, pollRemoteId, "votes"),
      bodyJson: {"choices": voteIndexes},
    );
    var httpResponse = await restService.sendHttpRequest(request);

    return parsePollResponse(httpResponse);
  }

  PleromaApiPoll parsePollResponse(Response httpResponse) {
    RestResponse<PleromaApiPoll> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaApiPoll.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaApiPollException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
