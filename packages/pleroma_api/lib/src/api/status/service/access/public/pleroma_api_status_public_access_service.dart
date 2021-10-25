import '../../../../account/pleroma_api_account_model.dart';
import '../../../../feature/pleroma_api_feature_model.dart';
import '../../../../pagination/pleroma_api_pagination_model.dart';
import '../../../../service/pleroma_api_service.dart';
import '../../../context/pleroma_api_status_context_model.dart';
import '../../../emoji_reaction/pleroma_api_status_emoji_reaction_model.dart';
import '../../../pleroma_api_status_model.dart';

abstract class IPleromaApiStatusPublicAccessService
    implements IPleromaApiService {
  IPleromaApiFeature get getEmojiReactionsFeature;

  IPleromaApiFeature get getEmojiReactionFeature;

  Future<List<IPleromaApiStatusEmojiReaction>> getEmojiReactions({
    required String statusId,
  });

  Future<IPleromaApiStatusEmojiReaction> getEmojiReaction({
    required String statusId,
    required String emoji,
  });

  IPleromaApiFeature get getStatusFeature;
  IPleromaApiFeature get getStatusesFeature;

  IPleromaApiFeature get getStatusContextFeature;

  IPleromaApiFeature get favouritedByFeature;

  IPleromaApiFeature get rebloggedByFeature;

  Future<IPleromaApiStatus> getStatus({
    required String statusId,
  });
  Future<List<IPleromaApiStatus>> getStatuses({
    required List<String> statusIds,
  });

  Future<IPleromaApiStatusContext> getStatusContext({
    required String statusId,
  });

  Future<List<IPleromaApiAccount>> favouritedBy({
    required String statusId,
    required IPleromaApiPagination? pagination,
  });

  Future<List<IPleromaApiAccount>> rebloggedBy({
    required String statusId,
    required IPleromaApiPagination? pagination,
  });
}
