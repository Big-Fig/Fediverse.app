import 'package:easy_dispose/easy_dispose.dart';
import 'package:mastodon_api/mastodon_api.dart';

import '../../../../account/pleroma_api_account_model.dart';
import '../../../../account/pleroma_api_account_model_impl.dart';
import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../feature/pleroma_api_feature_model_impl.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../rest/pleroma_api_rest_service.dart';
import '../../../../service/pleroma_api_service_impl.dart';
import '../../../pleroma_api_list_model.dart';
import '../../../pleroma_api_list_model_impl.dart';
import '../../../replies_policy_type/pleroma_api_card_replies_policy_type_sealed.dart';
import 'pleroma_api_list_user_access_service.dart';

class PleromaApiListUserAccessService extends PleromaApiService
    implements IPleromaApiListUserAccessService {
  final MastodonApiListUserAccessService mastodonApiListUserAccessService;

  PleromaApiListUserAccessService({
    required IPleromaApiRestService restService,
  })  : mastodonApiListUserAccessService = MastodonApiListUserAccessService(
          restService: restService.mastodonApiRestService,
        ),
        super(restService: restService) {
    mastodonApiListUserAccessService.disposeWith(this);
  }

  @override
  Future<List<IPleromaApiList>> getLists() =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getListsFeature,
        fieldFeatures: null,
        request: mastodonApiListUserAccessService.createGetListsRequest(),
        jsonParser: (json) => PleromaApiList.fromJson(json),
      );

  @override
  Future<IPleromaApiList> getList({
    required String listId,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: getListFeature,
        fieldFeatures: null,
        request: mastodonApiListUserAccessService.createGetListRequest(
          listId: listId,
        ),
        jsonParser: (json) => PleromaApiList.fromJson(json),
      );

  @override
  Future<void> deleteList({
    required String listId,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: deleteListFeature,
        fieldFeatures: null,
        request: mastodonApiListUserAccessService.createDeleteListRequest(
          listId: listId,
        ),
      );

  @override
  Future<IPleromaApiList> createList({
    required String title,
    required PleromaApiListRepliesPolicyType? repliesPolicy,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: createListFeature,
        fieldFeatures: [
          if (repliesPolicy != null) createListRepliesPolicyFeature,
        ],
        request: mastodonApiListUserAccessService.createCreateListRequest(
          title: title,
          repliesPolicy: repliesPolicy?.toMastodonApiListRepliesPolicyType(),
        ),
        jsonParser: (json) => PleromaApiList.fromJson(json),
      );

  @override
  Future<IPleromaApiList> updateList({
    required String listId,
    required String title,
    required PleromaApiListRepliesPolicyType? repliesPolicy,
  }) =>
      restService.sendHttpRequestAndParseJson(
        requestFeature: updateListFeature,
        fieldFeatures: [
          if (repliesPolicy != null) updateListRepliesPolicyFeature,
        ],
        request: mastodonApiListUserAccessService.createUpdateListRequest(
          listId: listId,
          title: title,
          repliesPolicy: repliesPolicy?.toMastodonApiListRepliesPolicyType(),
        ),
        jsonParser: (json) => PleromaApiList.fromJson(json),
      );

  @override
  Future<List<IPleromaApiAccount>> getListAccounts({
    required String listId,
    required IPleromaApiPagination? pagination,
  }) =>
      restService.sendHttpRequestAndParseJsonList(
        requestFeature: getListAccountsFeature,
        fieldFeatures: null,
        request: mastodonApiListUserAccessService.createGetListAccountsRequest(
          listId: listId,
          pagination: pagination,
        ),
        jsonParser: (json) => PleromaApiAccount.fromJson(json),
      );

  @override
  Future<void> addAccountsToList({
    required String listId,
    required List<String> accountIds,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: addAccountsToListFeature,
        fieldFeatures: null,
        request:
            mastodonApiListUserAccessService.createAddAccountsToListRequest(
          listId: listId,
          accountIds: accountIds,
        ),
      );

  @override
  Future<void> removeAccountsFromList({
    required String listId,
    required List<String> accountIds,
  }) =>
      restService.sendHttpRequestAndProcessEmpty(
        requestFeature: deleteListFeature,
        fieldFeatures: null,
        request: mastodonApiListUserAccessService.createDeleteListRequest(
          listId: listId,
        ),
      );

  @override
  IPleromaApiFeature get addAccountsToListFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.addAccountsToListFeature,
      );

  @override
  IPleromaApiFeature get createListFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.createListFeature,
      );

  @override
  IPleromaApiFeature get createListRepliesPolicyFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.createListRepliesPolicyFeature,
      );

  @override
  IPleromaApiFeature get deleteListFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.deleteListFeature,
      );

  @override
  IPleromaApiFeature get getListAccountsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.getListAccountsFeature,
      );

  @override
  IPleromaApiFeature get getListFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.getListFeature,
      );

  @override
  IPleromaApiFeature get getListsFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.getListsFeature,
      );

  @override
  IPleromaApiFeature get removeAccountsFromListFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.removeAccountsFromListFeature,
      );

  @override
  IPleromaApiFeature get updateListFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.updateListFeature,
      );

  @override
  IPleromaApiFeature get updateListRepliesPolicyFeature =>
      PleromaApiFeature.onlyUserRequirements(
        mastodonApiListUserAccessService.updateListRepliesPolicyFeature,
      );
}
