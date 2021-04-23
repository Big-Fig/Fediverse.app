import 'dart:convert';
import 'dart:io';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_account_public_exception.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_account_public_model.dart';
import 'package:fedi/pleroma/api/account/public/pleroma_account_public_service.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_oauth_model.dart';
import 'package:fedi/pleroma/api/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:fedi/rest/rest_response_model.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

var _logger = Logger("pleroma_account_public_service_impl.dart");

class PleromaAccountPublicService extends DisposableOwner
    implements IPleromaAccountPublicService {
  final accountRelativeUrlPath = "/api/v1/accounts/";
  @override
  final IPleromaRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaAccountPublicService({
    required this.restService,
  });

  @override
  Future<PleromaOAuthToken> registerAccount({
    required IPleromaAccountRegisterRequest request,
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
      return PleromaOAuthToken.fromJson(
        jsonDecode(
          httpResponse.body,
        ),
      );
    } else {
      throw PleromaAccountPublicException(
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
