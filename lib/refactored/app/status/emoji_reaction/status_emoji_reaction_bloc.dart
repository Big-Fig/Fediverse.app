import 'package:fedi/refactored/pleroma/status/pleroma_status_model.dart';
import 'package:fedi/refactored/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IStatusEmojiReactionBloc implements Disposable {
  static IStatusEmojiReactionBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IStatusEmojiReactionBloc>(context, listen: listen);

  IPleromaStatusEmojiReaction get emojiReaction;
  Stream<IPleromaStatusEmojiReaction> get emojiReactionStream;

  Future<IPleromaStatus> requestToggleEmojiReaction();
}
