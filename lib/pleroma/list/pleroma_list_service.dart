import 'package:fedi/pleroma/account/pleroma_account_model.dart';
import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/list/pleroma_list_model.dart';
import 'package:fedi/pleroma/pagination/pleroma_pagination_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaListService implements IPleromaApi {
  static IPleromaListService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaListService>(context, listen: listen);

  Future<List<IPleromaList>> getLists();

  Future<List<IPleromaAccount>> getListAccounts({
    required String? listRemoteId,
    IPleromaPaginationRequest? pagination,
  });

  Future addAccountsToList({
    required String? listRemoteId,
    required List<String?> accountIds,
  });

  Future removeAccountsFromList({
    required String? listRemoteId,
    required List<String?> accountIds,
  });

  Future<IPleromaList> getList({
    required String listRemoteId,
  });

  Future deleteList({
    required String? listRemoteId,
  });

  Future<IPleromaList> createList({
    required String? title,
  });

  Future<IPleromaList> updateList({
    required String? listRemoteId,
    required String? title,
  });
}
