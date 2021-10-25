import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/account/unifedi_api_account_model.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/list/replies_policy_type/unifedi_api_card_replies_policy_type_sealed.dart';
import '../../../api/list/service/unifedi_api_list_service.dart';
import '../../../api/list/unifedi_api_list_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../account/unifedi_api_account_model_mastodon_adapter.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../unifedi_api_list_model_mastodon_adapter.dart';

class UnifediApiListServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter implements IUnifediApiListService {
  final IMastodonApiListUserAccessService mastodonApiListUserAccessService;

  UnifediApiListServiceMastodonAdapter({
    required this.mastodonApiListUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService: mastodonApiListUserAccessService.restService,
      );

  @override
  Future<void> addAccountsToList({
    required String listId,
    required List<String> accountIds,
  }) =>
      mastodonApiListUserAccessService.addAccountsToList(
        listId: listId,
        accountIds: accountIds,
      );

  @override
  IUnifediApiFeature get addAccountsToListFeature =>
      mastodonApiListUserAccessService.addAccountsToListFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiList> createList({
    required String title,
    required UnifediApiListRepliesPolicyType? repliesPolicy,
  }) =>
      mastodonApiListUserAccessService
          .createList(
            title: title,
            repliesPolicy: repliesPolicy?.toMastodonApiListRepliesPolicyType(),
          )
          .then(
            (value) => value.toUnifediApiListMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get createListFeature =>
      mastodonApiListUserAccessService.createListFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get createListRepliesPolicyFeature =>
      mastodonApiListUserAccessService.createListRepliesPolicyFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> deleteList({
    required String listId,
  }) =>
      mastodonApiListUserAccessService.deleteList(
        listId: listId,
      );

  @override
  IUnifediApiFeature get deleteListFeature =>
      mastodonApiListUserAccessService.deleteListFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiList> getList({
    required String listId,
  }) =>
      mastodonApiListUserAccessService
          .getList(
            listId: listId,
          )
          .then(
            (value) => value.toUnifediApiListMastodonAdapter(),
          );

  @override
  Future<List<IUnifediApiAccount>> getListAccounts({
    required String listId,
    required IUnifediApiPagination? pagination,
  }) =>
      mastodonApiListUserAccessService
          .getListAccounts(
            listId: listId,
            pagination: pagination?.toMastodonApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiAccountMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getListAccountsFeature =>
      mastodonApiListUserAccessService.getListAccountsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get getListFeature =>
      mastodonApiListUserAccessService.getListFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<List<IUnifediApiList>> getLists() =>
      mastodonApiListUserAccessService.getLists().then(
            (value) => value.toUnifediApiListMastodonAdapterList(),
          );

  @override
  IUnifediApiFeature get getListsFeature =>
      mastodonApiListUserAccessService.getListsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<void> removeAccountsFromList({
    required String listId,
    required List<String> accountIds,
  }) =>
      mastodonApiListUserAccessService.removeAccountsFromList(
        listId: listId,
        accountIds: accountIds,
      );

  @override
  IUnifediApiFeature get removeAccountsFromListFeature =>
      mastodonApiListUserAccessService.removeAccountsFromListFeature
          .toUnifediApiFeatureMastodonAdapter();

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
      mastodonApiListUserAccessService.updateListFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  IUnifediApiFeature get updateListRepliesPolicyFeature =>
      mastodonApiListUserAccessService.updateListRepliesPolicyFeature
          .toUnifediApiFeatureMastodonAdapter();
}
