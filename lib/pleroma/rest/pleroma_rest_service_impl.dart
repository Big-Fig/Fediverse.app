import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_exception.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:rxdart/rxdart.dart';

var urlPath = path.Context(style: path.Style.url);

class PleromaRestService extends DisposableOwner
    implements IPleromaRestService {
  final IConnectionService connectionService;

  @override
  final bool isPleromaInstance;

  // TODO: rework seed state
  // ignore: close_sinks
  final BehaviorSubject<PleromaApiState> _stateSubject =
      BehaviorSubject.seeded(PleromaApiState.validAuth);

  @override
  PleromaApiState get pleromaState => _stateSubject.value;

  @override
  Stream<PleromaApiState> get pleromaStateStream => _stateSubject.stream;

  @override
  bool get isConnected => connectionService.isConnected;

  @override
  Stream<bool> get isConnectedStream => connectionService.isConnectedStream;

  @override
  Stream<bool> get isApiReadyToUseStream =>
      Rx.combineLatest2(pleromaStateStream, isConnectedStream, mapIsReady)
          .distinct();

  @override
  bool get isApiReadyToUse => mapIsReady(pleromaState, isConnected);

  @override
  final IRestService restService;

  @override
  Uri get baseUrl => restService.baseUrl;

  PleromaRestService({
    @required this.restService,
    @required this.connectionService,
    @required this.isPleromaInstance,
  }) {
    addDisposable(subject: _stateSubject);
  }

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) async {
    var response = await restService.sendHttpRequest(request);

    // todo: refactor pleroma errors handling
    if (response.statusCode == 429) {
      throw PleromaThrottledRestException(
          statusCode: response.statusCode, body: response.body);
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
