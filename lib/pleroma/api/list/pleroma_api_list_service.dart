import 'package:fedi/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:fedi/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:fedi/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiListService implements IPleromaApi {
  static IPleromaApiListService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiListService>(context, listen: listen);

  Future<List<IPleromaApiList>> getLists();

  Future<List<IPleromaApiAccount>> getListAccounts({
    required String listRemoteId,
    IPleromaApiPaginationRequest? pagination,
  });

  Future addAccountsToList({
    required String listRemoteId,
    required List<String> accountIds,
  });

  Future removeAccountsFromList({
    required String listRemoteId,
    required List<String> accountIds,
  });

  Future<IPleromaApiList> getList({
    required String listRemoteId,
  });

  Future deleteList({
    required String listRemoteId,
  });

  Future<IPleromaApiList> createList({
    required String title,
  });

  Future<IPleromaApiList> updateList({
    required String listRemoteId,
    required String title,
  });
}
