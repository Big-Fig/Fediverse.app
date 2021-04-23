import 'package:fedi/pleroma/api/pleroma_api_api_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaStatusEmojiReactionService extends IPleromaApi {
  static IPleromaStatusEmojiReactionService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaStatusEmojiReactionService>(
        context,
        listen: listen,
      );

  Future<IPleromaStatus> addReaction({
    required String statusRemoteId,
    required String emoji,
  });

  Future<IPleromaStatus> removeReaction({
    required String statusRemoteId,
    required String emoji,
  });

  Future<List<IPleromaStatusEmojiReaction>> getReactions({
    required String statusRemoteId,
  });

  Future<IPleromaStatusEmojiReaction> getReaction({
    required String statusRemoteId,
    required String emoji,
  });
}
