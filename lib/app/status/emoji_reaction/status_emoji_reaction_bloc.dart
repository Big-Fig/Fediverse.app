import 'package:easy_dispose/easy_dispose.dart';
import 'package:unifedi_api/unifedi_api.dart';
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

  IUnifediApiEmojiReaction get emojiReaction;

  Stream<IUnifediApiEmojiReaction> get emojiReactionStream;

  Future<IUnifediApiStatus> toggleEmojiReaction();
}
