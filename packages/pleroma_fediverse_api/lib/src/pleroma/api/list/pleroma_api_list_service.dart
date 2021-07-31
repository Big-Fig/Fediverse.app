import 'package:pleroma_fediverse_api/src/pleroma/api/account/pleroma_api_account_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/list/pleroma_api_list_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pagination/pleroma_api_pagination_model.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';

abstract class IPleromaApiListService implements IPleromaApi {
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
