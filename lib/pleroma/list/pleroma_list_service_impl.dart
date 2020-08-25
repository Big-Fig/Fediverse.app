import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_exception.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/list/pleroma_list_service.dart';
import 'package:fedi/pleroma/rest/pleroma_rest_service.dart';
import 'package:fedi/rest/rest_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;

var urlPath = path.Context(style: path.Style.url);

class PleromaListService implements IPleromaListService {
  final listRelativeUrlPath = "/api/v1/lists";
  @override
  final IPleromaRestService restService;

  @override
  bool get isPleromaInstance => restService.isPleromaInstance;

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

  PleromaListService({@required this.restService});

  IPleromaList parseListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaList.fromJsonString(httpResponse.body);
    } else {
      throw PleromaListException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaList> parseListListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaList.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaListException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  List<IPleromaAccount> parseAccountListResponse(Response httpResponse) {
    if (httpResponse.statusCode == 200) {
      return PleromaAccount.listFromJsonString(httpResponse.body);
    } else {
      throw PleromaListException(
          statusCode: httpResponse.statusCode, body: httpResponse.body);
    }
  }

  @override
  Future<List<IPleromaList>> getLists() async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(listRelativeUrlPath),
      ),
    );

    return parseListListResponse(httpResponse);
  }

  @override
  Future<IPleromaList> getList({@required String listRemoteId}) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath: urlPath.join(listRelativeUrlPath, listRemoteId),
      ),
    );

    return parseListResponse(httpResponse);
  }

  @override
  Future deleteList({@required String listRemoteId}) async {
    await restService.sendHttpRequest(
      RestRequest.delete(
        relativePath: urlPath.join(listRelativeUrlPath, listRemoteId),
      ),
    );
  }

  @override
  Future<IPleromaList> createList({@required String title}) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.post(
          relativePath: urlPath.join(listRelativeUrlPath),
          bodyJson: {
            "title": title,
          }),
    );

    return parseListResponse(httpResponse);
  }

  @override
  Future<IPleromaList> updateList({
    @required String listRemoteId,
    @required String title,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.put(
        relativePath: urlPath.join(listRelativeUrlPath, listRemoteId),
          bodyJson: {
            "title": title,
          }),
      ),
    );

    return parseListResponse(httpResponse);
  }

  @override
  void dispose() {
    // nothing
  }

  @override
  Future<List<IPleromaAccount>> getListAccounts({
    @required String listRemoteId,
    String sinceId,
    String maxId,
    int limit = 20,
  }) async {
    var httpResponse = await restService.sendHttpRequest(
      RestRequest.get(
        relativePath:
            urlPath.join(listRelativeUrlPath, listRemoteId, "accounts"),
      ),
    );

    return parseAccountListResponse(httpResponse);
  }

  @override
  Future addAccountsToList({
    @required String listRemoteId,
    @required List<String> accountIds,
  }) async {
    await restService.sendHttpRequest(
      RestRequest.post(
          relativePath:
              urlPath.join(listRelativeUrlPath, listRemoteId, "accounts"),
          bodyJson: {"account_ids": accountIds}),
    );
  }

  @override
  Future removeAccountsFromList({
    @required String listRemoteId,
    @required List<String> accountIds,
  }) async {
    await restService.sendHttpRequest(
      RestRequest.delete(
          relativePath:
              urlPath.join(listRelativeUrlPath, listRemoteId, "accounts"),
          bodyJson: {"account_ids": accountIds}),
    );
  }
}
