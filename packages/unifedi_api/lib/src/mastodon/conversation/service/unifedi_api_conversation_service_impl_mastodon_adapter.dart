import 'package:mastodon_api/mastodon_api.dart';

import '../../../api/conversation/service/unifedi_api_conversation_service.dart';
import '../../../api/conversation/unifedi_api_conversation_model.dart';
import '../../../api/feature/type/unifedi_api_type_not_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../feature/unifedi_api_feature_model_mastodon_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_mastodon_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_mastodon_adapter.dart';
import '../../service/unifedi_api_service_mastodon_adapter.dart';
import '../unifedi_api_conversation_model_mastodon_adapter.dart';

class UnifediApiConversationServiceMastodonAdapter
    extends UnifediApiServiceMastodonAdapter
    implements IUnifediApiConversationService {
  final IMastodonApiConversationUserAccessService
      mastodonApiConversationUserAccessService;

  UnifediApiConversationServiceMastodonAdapter({
    required this.mastodonApiConversationUserAccessService,
  });

  @override
  IUnifediApiRestService get restService =>
      UnifediApiRestServiceMastodonAdapter(
        mastodonApiRestService:
            mastodonApiConversationUserAccessService.restService,
      );

  @override
  Future<void> deleteConversation({
    required String conversationId,
  }) =>
      mastodonApiConversationUserAccessService.deleteConversation(
        conversationId: conversationId,
      );

  @override
  IUnifediApiFeature get deleteConversationFeature =>
      mastodonApiConversationUserAccessService.deleteConversationFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  Future<IUnifediApiConversation> getConversation({
    required String conversationId,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getConversationFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getConversationFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getConversationFeature',
      );

  @override
  Future<List<IUnifediApiStatus>> getConversationStatuses({
    required String conversationId,
    required IUnifediApiPagination? pagination,
  }) =>
      throw UnifediApiTypeNotSupportedFeature.createMethodNotSupportedException(
        feature: getConversationStatusesFeature,
      );

  @override
  UnifediApiTypeNotSupportedFeature get getConversationStatusesFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getConversationStatusesFeature',
      );

  @override
  Future<List<IUnifediApiConversation>> getConversations({
    required IUnifediApiPagination? pagination,
    required List<String>? recipientsIds,
  }) {
    UnifediApiTypeNotSupportedFeature.assertArgNotSupported(
      argValue: recipientsIds,
      feature: getConversationsRecipientsIdsFeature,
    );

    return mastodonApiConversationUserAccessService
        .getConversations(
          pagination: pagination?.toMastodonApiPagination(),
        )
        .then(
          (value) => value.toUnifediApiConversationMastodonAdapterList(),
        );
  }

  @override
  IUnifediApiFeature get getConversationsFeature =>
      mastodonApiConversationUserAccessService.getConversationsFeature
          .toUnifediApiFeatureMastodonAdapter();

  @override
  UnifediApiTypeNotSupportedFeature get getConversationsRecipientsIdsFeature =>
      const UnifediApiTypeNotSupportedFeature(
        target: 'getConversationsRecipientsIdsFeature',
      );

  @override
  Future<IUnifediApiConversation> markConversationAsRead({
    required String conversationId,
  }) =>
      mastodonApiConversationUserAccessService
          .markConversationAsRead(
            conversationId: conversationId,
          )
          .then(
            (value) => value.toUnifediApiConversationMastodonAdapter(),
          );

  @override
  IUnifediApiFeature get markConversationAsReadFeature =>
      mastodonApiConversationUserAccessService.markConversationAsReadFeature
          .toUnifediApiFeatureMastodonAdapter();
}
