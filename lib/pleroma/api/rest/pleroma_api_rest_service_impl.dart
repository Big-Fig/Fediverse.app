import 'dart:convert';

import 'package:fedi/connection/connection_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:fedi/rest/rest_service.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger("pleroma_rest_service_impl.dart");

class PleromaApiRestService extends DisposableOwner
    implements IPleromaApiRestService {
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
  final IRestService restService;

  @override
  Uri get baseUri => restService.baseUri;

  PleromaApiRestService({
    required this.restService,
    required this.connectionService,
  }) {
    addDisposable(subject: _pleromaApiStateSubject);
  }

  @override
  Future<Response> sendHttpRequest<T extends RestRequest, K>(T request) async {
    var response = await restService.sendHttpRequest(request);

    return response;
  }

  @override
  Future<Response>
      uploadFileMultipartRequest<T extends UploadMultipartRestRequest, K>(
    T request,
  ) {
    return restService.uploadFileMultipartRequest(request);
  }

  @override
  void processEmptyResponse<T>(
    Response response,
  ) {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      return;
    } else {
      throw createException(response);
    }
  }

  @override
  String processStringResponse(
    Response response,
  ) {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      return response.body;
    } else {
      throw createException(response);
    }
  }

  @override
  List<String> processStringListResponse(
    Response response,
  ) {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      var json = jsonDecode(response.body);
      if (json is Iterable<String>) {
        return json.toList();
      } else {
        throw PleromaApiNotJsonResponseRestException(
          statusCode: response.statusCode,
          body: response.body,
        );
      }
    } else {
      throw createException(response);
    }
  }

  @override
  List<T> processJsonListResponse<T>(
    Response response,
    ResponseJsonParser<T> responseJsonParser,
  ) {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      var json = parseJson(response);

      if (json is Iterable) {
        return json
            .map(
              (jsonItem) =>
                  responseJsonParser(jsonItem as Map<String, dynamic>),
            )
            .toList();
      } else {
        throw PleromaApiNotJsonListResponseRestException(
          statusCode: response.statusCode,
          body: response.body,
        );
      }
    } else {
      throw createException(response);
    }
  }

  @override
  T processJsonSingleResponse<T>(
    Response response,
    ResponseJsonParser<T> responseJsonParser,
  ) {
    var statusCode = response.statusCode;

    if (statusCode == RestResponse.successResponseStatusCode) {
      var json = parseJson(response);

      if (json is Map<String, dynamic>) {
        return responseJsonParser(json);
      } else {
        throw PleromaApiNotJsonListResponseRestException(
          statusCode: response.statusCode,
          body: response.body,
        );
      }
    } else {
      throw createException(response);
    }
  }

  dynamic parseJson(Response response) {
    // todo: support not only json
    var body = response.body;

    try {
      var json = jsonDecode(body);
      return json;
    } catch (e, stackTrace) {
      _logger.severe(() => "Cant parse json from: $body", e, stackTrace);

      throw PleromaApiNotJsonResponseRestException(
        statusCode: response.statusCode,
        body: body,
      );
    }
  }

  Exception createException(Response response) {
    var statusCode = response.statusCode;

    // todo: more pleroma-related errors handling
    switch (statusCode) {
      case PleromaApiUnprocessableOrThrottledRestException.httpStatusCode:
        throw PleromaApiUnprocessableOrThrottledRestException(
          statusCode: statusCode,
          body: response.body,
        );
      case PleromaApiForbiddenRestException.httpStatusCode:
        throw PleromaApiForbiddenRestException(
          statusCode: statusCode,
          body: response.body,
        );

      default:
        var body = response.body;
        var isInvalidCredentials;
        try {
          Map<String, dynamic> jsonBody = jsonDecode(body);

          var error = jsonBody[PleromaApiRestException.jsonBodyErrorKey];
          var isPleromaInvalidCredentials = error ==
                  PleromaApiInvalidCredentialsForbiddenRestException
                      .pleromaInvalidCredentialsErrorValue &&
              statusCode ==
                  PleromaApiInvalidCredentialsForbiddenRestException
                      .pleromaInvalidCredentialsStatusCode;
          var isMastodonInvalidCredentials = error ==
                  PleromaApiInvalidCredentialsForbiddenRestException
                      .mastodonInvalidCredentialsErrorValue &&
              statusCode ==
                  PleromaApiInvalidCredentialsForbiddenRestException
                      .mastodonInvalidCredentialsStatusCode;
          isInvalidCredentials =
              isPleromaInvalidCredentials || isMastodonInvalidCredentials;
        } catch (e) {
          isInvalidCredentials = false;
        }
        if (isInvalidCredentials) {
          _pleromaApiStateSubject.add(PleromaApiState.brokenAuth);
          _logger.finest(() => "pleromaApiState $pleromaApiState");
          throw PleromaApiInvalidCredentialsForbiddenRestException(
            statusCode: response.statusCode,
            body: body,
          );
        } else {
          throw PleromaApiUnknownRestException(
            statusCode: response.statusCode,
            body: body,
          );
        }
    }
  }
}
