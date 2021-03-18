import 'dart:convert';

import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_model.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:rxdart/rxdart.dart';

final _logger = Logger("pleroma_rest_service_impl.dart");

var urlPath = path.Context(style: path.Style.url);

class PleromaRestService extends DisposableOwner
    implements IPleromaRestService {
  final IConnectionService connectionService;

  // TODO: rework seed state
  // ignore: close_sinks
  final BehaviorSubject<PleromaApiState> _pleromaApiStateSubject =
      BehaviorSubject.seeded(PleromaApiState.validAuth);

  @override
  PleromaApiState get pleromaApiState => _pleromaApiStateSubject.value!;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      _pleromaApiStateSubject.stream;

  @override
  bool get isConnected => connectionService.isConnected;

  @override
  Stream<bool> get isConnectedStream => connectionService.isConnectedStream;

  @override
  Stream<bool> get isApiReadyToUseStream => Rx.combineLatest2(
        pleromaApiStateStream,
        isConnectedStream,
        mapIsReady,
      ).distinct();

  @override
  bool get isApiReadyToUse => mapIsReady(pleromaApiState, isConnected);

  @override
  final IRestService restService;

  @override
  Uri get baseUri => restService.baseUri;

  PleromaRestService({
    required this.restService,
    required this.connectionService,
  }) {
    addDisposable(subject: _pleromaApiStateSubject);
  }

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) async {
    var response = await restService.sendHttpRequest(request);

    var statusCode = response.statusCode;
    // todo: refactor pleroma errors handling
    if (response.statusCode == 429) {
      throw PleromaThrottledRestException(
        statusCode: statusCode,
        body: response.body,
      );
    }

    if (statusCode >= 400 && statusCode < 500) {
      var body = response.body;
      var isInvalidCredentials;
      try {
        Map<String, dynamic> jsonBody = jsonDecode(body);

        var error = jsonBody[PleromaRestException.jsonBodyErrorKey];
        var isPleromaInvalidCredentials = error ==
                PleromaInvalidCredentialsForbiddenRestException
                    .pleromaInvalidCredentialsErrorValue &&
            statusCode ==
                PleromaInvalidCredentialsForbiddenRestException
                    .pleromaInvalidCredentialsStatusCode;
        var isMastodonInvalidCredentials = error ==
                PleromaInvalidCredentialsForbiddenRestException
                    .mastodonInvalidCredentialsErrorValue &&
            statusCode ==
                PleromaInvalidCredentialsForbiddenRestException
                    .mastodonInvalidCredentialsStatusCode;
        isInvalidCredentials =
            isPleromaInvalidCredentials || isMastodonInvalidCredentials;
      } catch (e) {
        isInvalidCredentials = false;
      }
      if (isInvalidCredentials) {
        _pleromaApiStateSubject.add(PleromaApiState.brokenAuth);
        _logger.finest(() => "pleromaApiState $pleromaApiState");
        throw PleromaInvalidCredentialsForbiddenRestException(
          statusCode: response.statusCode,
          body: body,
        );
      } else {
        throw PleromaForbiddenRestException(
          statusCode: response.statusCode,
          body: body,
        );
      }
    }
    return response;
  }

  @override
  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
          T request) {
    return restService.uploadFileMultipartRequest(request);
  }
}
