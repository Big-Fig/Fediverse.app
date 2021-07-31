import 'package:pleroma_fediverse_api/src/pleroma/api/pleroma_api_service.dart';
import 'package:pleroma_fediverse_api/src/pleroma/api/status/pleroma_api_status_model.dart';

abstract class IPleromaApiStatusEmojiReactionService extends IPleromaApi {
  Future<IPleromaApiStatus> addReaction({
    required String statusRemoteId,
    required String emoji,
  });

  Future<IPleromaApiStatus> removeReaction({
    required String statusRemoteId,
    required String emoji,
  });

  Future<List<IPleromaApiStatusEmojiReaction>> getReactions({
    required String statusRemoteId,
  });

  Future<IPleromaApiStatusEmojiReaction> getReaction({
    required String statusRemoteId,
    required String emoji,
  });
}
