import 'package:fedi/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:fedi/app/instance/announcement/emoji_reaction/instance_announcement_emoji_reaction_model_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class InstanceAnnouncementEmojiReactionAdapterProxyProvider
    extends StatelessWidget {
  final Widget child;

  InstanceAnnouncementEmojiReactionAdapterProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IUnifediApiEmojiReaction, IEmojiReaction>(
      update: (context, value, previous) =>
          InstanceAnnouncementEmojiReactionAdapter(
        unifediApiEmojiReaction: value,
      ),
      child: child,
    );
  }
}
