import 'dart:convert';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_exception.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_model.dart';
import 'package:fedi/pleroma/api/instance/pleroma_api_instance_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaApiInstanceService extends DisposableOwner
    implements IPleromaApiInstanceService {
  final instanceRelativeUrlPath = "/api/v1/instance";
  @override
  final IPleromaApiRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaApiInstanceService({
    required this.restService,
  });

  List<String> parseInstancePeers(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return jsonDecode(httpResponse.body);
    } else {
      throw PleromaApiInstanceException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  IPleromaApiInstance parseInstanceResponse(Response httpResponse) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiInstance.fromJsonString(httpResponse.body);
    } else {
      throw PleromaApiInstanceException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaApiInstanceHistory> parseInstanceHistoryListResponse(
    Response httpResponse,
  ) {
    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      return PleromaApiInstanceHistory.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaApiInstanceException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<List<IPleromaApiInstanceHistory>> getHistory() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(
          instanceRelativeUrlPath,
          "activity",
        ),
      ),
    );

    return parseInstanceHistoryListResponse(httpResponse);
  }

  @override
  Future<IPleromaApiInstance> getInstance() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: instanceRelativeUrlPath,
      ),
    );

    return parseInstanceResponse(httpResponse);
  }

  @override
  Future<List<String>> getPeers() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(
          instanceRelativeUrlPath,
          "peers",
        ),
      ),
    );

    return parseInstancePeers(httpResponse);
  }

  @override
  Future dispose() async {
    return await super.dispose();
  }
}
