import 'package:fedi/pleroma/api/pleroma_api_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaApiStatusEmojiReactionService extends IPleromaApi {
  static IPleromaApiStatusEmojiReactionService of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPleromaApiStatusEmojiReactionService>(
        context,
        listen: listen,
      );

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
