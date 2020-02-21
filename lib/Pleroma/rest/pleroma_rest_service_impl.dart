import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/api/pleroma_api_service.dart';
import 'package:fedi/Pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:rxdart/rxdart.dart';

var urlPath = path.Context(style: path.Style.url);

class PleromaRestService implements IPleromaRestService {
  final IConnectionService connectionService;

  // ignore: close_sinks
  BehaviorSubject<PleromaApiState> _stateSubject;

  @override
  PleromaApiState get pleromaState => _stateSubject.value;

  @override
  Stream<PleromaApiState> get pleromaStateStream => _stateSubject.stream;


  @override
  bool get isConnected => connectionService.isConnected;

  @override
  Stream<bool> get isConnectedStream => connectionService.isConnectedStream;

  Stream<bool> get isApiReadyToUseStream => Rx.combineLatest2(
      pleromaStateStream, isConnectedStream, mapIsReady)
      .distinct();

  bool get isApiReadyoUse => mapIsReady(pleromaState, isConnected);


  final IRestService restService;


  @override
  String get baseUrl => restService.baseUrl;

  PleromaRestService(
      {@required
          this.restService, @required this.connectionService});

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) {
    return restService.sendHttpRequest(request);
  }

  @override
  Future<Response> uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(T request) {
    return restService.uploadFileMultipartRequest(request);
  }

  @override
  void dispose() {
    // nothing
  }

}
