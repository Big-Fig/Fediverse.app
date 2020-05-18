import 'dart:convert';

import 'package:fedi/refactored/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/refactored/pleroma/instance/pleroma_instance_exception.dart';
import 'package:fedi/refactored/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/refactored/pleroma/instance/pleroma_instance_service.dart';
import 'package:fedi/refactored/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/refactored/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaInstanceService implements IPleromaInstanceService {
  final instanceRelativeUrlPath = "/api/v1/instance";
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaStateStream =>
      restService.pleromaStateStream;

  @override
  PleromaApiState get pleromaState => restService.pleromaState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaInstanceService({@required this.restService});

  List<String> parseInstancePeers(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return jsonDecode(httpResponse.body);
    } else {
      throw PleromaInstanceException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  IPleromaInstance parseInstanceResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaInstance.fromJsonString(httpResponse.body);
    } else {
      throw PleromaInstanceException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaInstanceHistory> parseInstanceHistoryListResponse(
      Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaInstanceHistory.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaInstanceException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaInstanceHistory>> getHistory() async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: urlPath.join(instanceRelativeUrlPath, "activity")));

    return parseInstanceHistoryListResponse(httpResponse);
  }

  @override
  Future<IPleromaInstance> getInstance() async {
    var httpResponse = await restService.sendHttpRequest(
        RestRequest.get(relativePath: instanceRelativeUrlPath));

    return parseInstanceResponse(httpResponse);
  }

  @override
  Future<List<String>> getPeers() async {
    var httpResponse = await restService.sendHttpRequest(RestRequest.get(
        relativePath: urlPath.join(instanceRelativeUrlPath, "peers")));

    return parseInstancePeers(httpResponse);
  }

  @override
  void dispose() {
    // nothing
  }
}
