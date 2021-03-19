import 'dart:convert';

import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_exception.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_model.dart';
import 'package:fedi/pleroma/account/my/pleroma_my_account_service.dart';
import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:fedi/pleroma/rest/auth/pleroma_auth_rest_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

var _logger = Logger("pleroma_my_account_service_impl.dart");

class PleromaMyAccountService extends DisposableOwner
    implements IPleromaMyAccountService {
  final verifyProfileRelativeUrlPath = "/api/v1/accounts/verify_credentials";
  final editProfileRelativeUrlPath = "/api/v1/accounts/update_credentials";
  @override
  final IPleromaAuthRestService restService;

  @override
  Stream<PleromaApiState> get pleromaApiStateStream =>
      restService.pleromaApiStateStream;

  @override
  PleromaApiState get pleromaApiState => restService.pleromaApiState;

  @override
  Stream<bool> get isApiReadyToUseStream => restService.isApiReadyToUseStream;

  @override
  bool get isApiReadyToUse => restService.isApiReadyToUse;

  @override
  bool get isConnected => restService.isConnected;

  @override
  Stream<bool> get isConnectedStream => restService.isConnectedStream;

  PleromaMyAccountService({required this.restService});

  IPleromaMyAccount parseMyAccountResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaMyAccount.fromJsonString(
        httpResponse.body,
      );
    } else {
      throw PleromaMyAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  IPleromaAccountRelationship parseAccountRelationshipResponse(
    Response httpResponse,
  ) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccountRelationship.fromJsonString(httpResponse.body);
    } else {
      throw PleromaMyAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaStatus> parseStatusListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaStatus.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaMyAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<IPleromaAccount> parseAccountListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccount.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaMyAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  List<String> parseStringListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      var result = <String>[];
      try {
        var list = json.decode(httpResponse.body) as List;
        list.forEach((element) {
          result.add(element.toString());
        });
      } catch (e, stackTrace) {
        _logger.severe(() => "failed to parse domain list", e, stackTrace);
      }
      return result;
    } else {
      throw PleromaMyAccountException(
        statusCode: httpResponse.statusCode,
        body: httpResponse.body,
      );
    }
  }

  @override
  Future<IPleromaMyAccount> updateCredentials(
    IPleromaMyAccountEdit data,
  ) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.patch(
        relativePath: editProfileRelativeUrlPath,
        bodyJson: data.toJson(),
      ),
    );

    return parseMyAccountResponse(httpResponse);
  }

  @override
  Future<IPleromaMyAccount> updateFiles(
    PleromaMyAccountFilesRequest accountFiles,
  ) async {
    _logger.finest(() => "updateFiles $accountFiles");
    var httpResponse = await restService.uploadFileMultipartRequest(
      UploadMultipartRestRequest.patch(
        relativePath: editProfileRelativeUrlPath,
        files: {
          if (accountFiles.header != null) "header": accountFiles.header!,
          if (accountFiles.avatar != null) "avatar": accountFiles.avatar!,
          if (accountFiles.pleromaBackgroundImage != null)
            "pleroma_background_image": accountFiles.pleromaBackgroundImage!,
        },
      ),
    );

    return parseMyAccountResponse(httpResponse);
  }

  @override
  Future<IPleromaMyAccount> verifyCredentials() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(relativePath: verifyProfileRelativeUrlPath),
    );

    return parseMyAccountResponse(httpResponse);
  }

  @override
  Future<List<IPleromaStatus>> getBookmarks({
    IPleromaPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join("api/v1/bookmarks"),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return parseStatusListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaStatus>> getFavourites({
    IPleromaPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join("api/v1/favourites"),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return parseStatusListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> getFollowRequests({
    IPleromaPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join("api/v1/follow_requests"),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future dispose() async {
    return await super.dispose();
  }

  @override
  Future<IPleromaAccountRelationship> acceptFollowRequest({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          "api/v1/follow_requests",
          accountRemoteId,
          "authorize",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<IPleromaAccountRelationship> rejectFollowRequest({
    required String accountRemoteId,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
        relativePath: urlPath.join(
          "api/v1/follow_requests",
          accountRemoteId,
          "reject",
        ),
      ),
    );

    return parseAccountRelationshipResponse(httpResponse);
  }

  @override
  Future<List<String>> getDomainBlocks({
    IPleromaPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join("api/v1/domain_blocks"),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return parseStringListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> getAccountBlocks({
    IPleromaPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join("api/v1/blocks"),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future<List<IPleromaAccount>> getAccountMutes({
    IPleromaPaginationRequest? pagination,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join("api/v1/mutes"),
        queryArgs: pagination?.toQueryArgs(),
      ),
    );

    return parseAccountListResponse(httpResponse);
  }
}
