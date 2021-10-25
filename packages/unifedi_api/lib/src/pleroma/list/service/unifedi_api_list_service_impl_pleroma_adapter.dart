import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/list/replies_policy_type/unifedi_api_card_replies_policy_type_sealed.dart';
import '../../../api/list/service/unifedi_api_list_service.dart';
import '../../../api/list/unifedi_api_list_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../account/unifedi_api_account_model_pleroma_adapter.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../unifedi_api_list_model_pleroma_adapter.dart';

class UnifediApiListServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter implements IUnifediApiListService {
  final IPleromaApiListUserAccessService pleromaApiListUserAccessService;

  UnifediApiListServicePleromaAdapter({
    required this.pleromaApiListUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService: pleromaApiListUserAccessService.restService,
      );

  @override
  Future<void> addAccountsToList({
    required String listId,
    required List<String> accountIds,
  }) =>
      pleromaApiListUserAccessService.addAccountsToList(
        listId: listId,
        accountIds: accountIds,
      );

  @override
  IUnifediApiFeature get addAccountsToListFeature =>
      pleromaApiListUserAccessService.addAccountsToListFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiList> createList({
    required String title,
    required UnifediApiListRepliesPolicyType? repliesPolicy,
  }) =>
      pleromaApiListUserAccessService
          .createList(
            title: title,
            repliesPolicy: repliesPolicy?.toPleromaApiListRepliesPolicyType(),
          )
          .then(
            (value) => value.toUnifediApiListPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get createListFeature =>
      pleromaApiListUserAccessService.createListFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get createListRepliesPolicyFeature =>
      pleromaApiListUserAccessService.createListRepliesPolicyFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> deleteList({
    required String listId,
  }) =>
      pleromaApiListUserAccessService.deleteList(
        listId: listId,
      );

  @override
  IUnifediApiFeature get deleteListFeature =>
      pleromaApiListUserAccessService.deleteListFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiList> getList({
    required String listId,
  }) =>
      pleromaApiListUserAccessService
          .getList(
            listId: listId,
          )
          .then(
            (value) => value.toUnifediApiListPleromaAdapter(),
          );

  @override
  Future<List<IUnifediApiAccount>> getListAccounts({
    required String listId,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiListUserAccessService
          .getListAccounts(
            listId: listId,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getListAccountsFeature =>
      pleromaApiListUserAccessService.getListAccountsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get getListFeature =>
      pleromaApiListUserAccessService.getListFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiList>> getLists() =>
      pleromaApiListUserAccessService.getLists().then(
            (value) => value.toUnifediApiListPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getListsFeature =>
      pleromaApiListUserAccessService.getListsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<void> removeAccountsFromList({
    required String listId,
    required List<String> accountIds,
  }) =>
      pleromaApiListUserAccessService.removeAccountsFromList(
        listId: listId,
        accountIds: accountIds,
      );

  @override
  IUnifediApiFeature get removeAccountsFromListFeature =>
      pleromaApiListUserAccessService.removeAccountsFromListFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiList> updateList({
    required String listId,
    required String title,
    required UnifediApiListRepliesPolicyType? repliesPolicy,
  }) {
    throw UnimplementedError();
  }

  @override
  IUnifediApiFeature get updateListFeature =>
      pleromaApiListUserAccessService.updateListFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  IUnifediApiFeature get updateListRepliesPolicyFeature =>
      pleromaApiListUserAccessService.updateListRepliesPolicyFeature
          .toUnifediApiFeaturePleromaAdapter();
}
