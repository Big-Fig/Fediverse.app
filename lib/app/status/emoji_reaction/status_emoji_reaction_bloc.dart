import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusEmojiReactionBloc implements IDisposable {
  static IStatusEmojiReactionBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IStatusEmojiReactionBloc>(
        context,
        listen: listen,
      );

  IPleromaApiStatusEmojiReaction get emojiReaction;

  Stream<IPleromaApiStatusEmojiReaction> get emojiReactionStream;

  Future<IPleromaApiStatus> toggleEmojiReaction();
}
