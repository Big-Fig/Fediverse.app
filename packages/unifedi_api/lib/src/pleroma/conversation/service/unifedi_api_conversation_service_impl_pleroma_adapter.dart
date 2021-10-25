import 'package:pleroma_api/pleroma_api.dart';

import '../../../api/conversation/service/unifedi_api_conversation_service.dart';
import '../../../api/conversation/unifedi_api_conversation_model.dart';
import '../../../api/feature/type/unifedi_api_type_supported_feature_model_impl.dart';
import '../../../api/feature/unifedi_api_feature_model.dart';
import '../../../api/pagination/unifedi_api_pagination_model.dart';
import '../../../api/rest/unifedi_api_rest_service.dart';
import '../../../api/status/unifedi_api_status_model.dart';
import '../../feature/unifedi_api_feature_model_pleroma_adapter.dart';
import '../../pagination/unifedi_api_pagination_model_pleroma_adapter.dart';

import '../../rest/unifedi_api_rest_service_impl_pleroma_adapter.dart';
import '../../service/unifedi_api_service_pleroma_adapter.dart';
import '../../status/unifedi_api_status_model_pleroma_adapter.dart';
import '../unifedi_api_conversation_model_pleroma_adapter.dart';

class UnifediApiConversationServicePleromaAdapter
    extends UnifediApiServicePleromaAdapter
    implements IUnifediApiConversationService {
  final IPleromaApiConversationUserAccessService
      pleromaApiConversationUserAccessService;

  UnifediApiConversationServicePleromaAdapter({
    required this.pleromaApiConversationUserAccessService,
  });

  @override
  IUnifediApiRestService get restService => UnifediApiRestServicePleromaAdapter(
        pleromaApiRestService:
            pleromaApiConversationUserAccessService.restService,
      );

  @override
  Future<void> deleteConversation({
    required String conversationId,
  }) =>
      pleromaApiConversationUserAccessService.deleteConversation(
        conversationId: conversationId,
      );

  @override
  IUnifediApiFeature get deleteConversationFeature =>
      pleromaApiConversationUserAccessService.deleteConversationFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiConversation> getConversation({
    required String conversationId,
  }) =>
      pleromaApiConversationUserAccessService
          .getConversation(
            conversationId: conversationId,
          )
          .then(
            (value) => value.toUnifediApiConversationPleromaAdapter(),
          );

  @override
  UnifediApiTypeSupportedFeature get getConversationsRecipientsIdsFeature =>
      const UnifediApiTypeSupportedFeature();

  @override
  IUnifediApiFeature get getConversationFeature =>
      pleromaApiConversationUserAccessService.getConversationFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiStatus>> getConversationStatuses({
    required String conversationId,
    required IUnifediApiPagination? pagination,
  }) =>
      pleromaApiConversationUserAccessService
          .getConversationStatuses(
            conversationId: conversationId,
            pagination: pagination?.toPleromaApiPagination(),
          )
          .then(
            (value) => value.toUnifediApiStatusPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getConversationStatusesFeature =>
      pleromaApiConversationUserAccessService.getConversationStatusesFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<List<IUnifediApiConversation>> getConversations({
    required IUnifediApiPagination? pagination,
    required List<String>? recipientsIds,
  }) =>
      pleromaApiConversationUserAccessService
          .getConversations(
            pagination: pagination?.toPleromaApiPagination(),
            recipientsIds: recipientsIds,
          )
          .then(
            (value) => value.toUnifediApiConversationPleromaAdapterList(),
          );

  @override
  IUnifediApiFeature get getConversationsFeature =>
      pleromaApiConversationUserAccessService.getConversationsFeature
          .toUnifediApiFeaturePleromaAdapter();

  @override
  Future<IUnifediApiConversation> markConversationAsRead({
    required String conversationId,
  }) =>
      pleromaApiConversationUserAccessService
          .markConversationAsRead(
            conversationId: conversationId,
          )
          .then(
            (value) => value.toUnifediApiConversationPleromaAdapter(),
          );

  @override
  IUnifediApiFeature get markConversationAsReadFeature =>
      pleromaApiConversationUserAccessService.markConversationAsReadFeature
          .toUnifediApiFeaturePleromaAdapter();
}
