import 'package:fedi/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_model_adapter.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StatusEmojiReactionAdapterProxyProvider extends StatelessWidget {
  final Widget child;

  StatusEmojiReactionAdapterProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IUnifediApiEmojiReaction, IEmojiReaction>(
      update: (context, value, previous) => StatusEmojiReactionAdapter(
        unifediApiEmojiReaction: value,
      ),
      child: child,
    );
  }
}
