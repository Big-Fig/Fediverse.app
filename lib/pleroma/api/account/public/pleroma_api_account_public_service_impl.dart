import 'dart:convert';
import 'dart:io';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_exception.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_model.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_api_account_public_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_api_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

var _logger = Logger("pleroma_account_public_service_impl.dart");

class PleromaApiAccountPublicService extends DisposableOwner
    implements IPleromaApiAccountPublicService {
  final accountRelativeUrlPath = "/api/v1/accounts/";
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

  PleromaApiAccountPublicService({
    required this.restService,
  });

  @override
  Future<PleromaApiOAuthToken> registerAccount({
    required IPleromaApiAccountRegisterRequest request,
    required String? appAccessToken,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(accountRelativeUrlPath),
        headers: {
          HttpHeaders.authorizationHeader: "Bearer $appAccessToken",
        },
        bodyJson: request.toJson(),
      ),
    );

    if (httpResponse.statusCode == RestResponse.successResponseStatusCode) {
      _logger.finest(() => "registerAccount ${httpResponse.body}");
      return PleromaApiOAuthToken.fromJson(
        jsonDecode(
          httpResponse.body,
        ),
      );
    } else {
      throw PleromaApiAccountPublicException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future dispose() async {
    return await super.dispose();
  }
}
