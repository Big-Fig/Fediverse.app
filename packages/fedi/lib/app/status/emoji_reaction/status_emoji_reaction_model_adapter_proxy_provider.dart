import 'package:fedi/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_model_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusEmojiReactionAdapterProxyProvider extends StatelessWidget {
  final Widget child;

  const StatusEmojiReactionAdapterProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IUnifediApiEmojiReaction, IEmojiReaction>(
        update: (context, value, previous) => StatusEmojiReactionAdapter(
          unifediApiEmojiReaction: value,
        ),
        child: child,
      );
}
