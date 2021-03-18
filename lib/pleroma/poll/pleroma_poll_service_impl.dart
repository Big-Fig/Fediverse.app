import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_exception.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_model.dart';
import 'package:fedi/pleroma/poll/pleroma_poll_service.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class PleromaPollService extends DisposableOwner
    implements IPleromaPollService {
  final pollRelativeUrlPath = "/api/v1/polls/";
  @override
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState? get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaPollService({required this.restService});

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<IPleromaPoll> getPoll({
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
  Future<IPleromaPoll> vote({
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

  PleromaPoll parsePollResponse(Response httpResponse) {
    RestResponse<PleromaPoll> restResponse = RestResponse.fromResponse(
      response: httpResponse,
      resultParser: (body) => PleromaPoll.fromJsonString(
        httpResponse.body,
      ),
    );

    if (restResponse.isSuccess) {
      return restResponse.body!;
    } else {
      throw PleromaPollException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }
}
