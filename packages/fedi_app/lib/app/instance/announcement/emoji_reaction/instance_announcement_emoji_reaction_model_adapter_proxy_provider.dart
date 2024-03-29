import 'package:fedi_app/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:fedi_app/app/instance/announcement/emoji_reaction/instance_announcement_emoji_reaction_model_adapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class InstanceAnnouncementEmojiReactionAdapterProxyProvider
    extends StatelessWidget {
  final Widget child;

  const InstanceAnnouncementEmojiReactionAdapterProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IUnifediApiEmojiReaction, IEmojiReaction>(
        update: (context, value, previous) =>
            InstanceAnnouncementEmojiReactionAdapter(
          unifediApiEmojiReaction: value,
        ),
        child: child,
      );
}
