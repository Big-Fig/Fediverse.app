import 'package:fedi/app/emoji/reaction/emoji_reaction_model.dart';
import 'package:fedi/app/instance/announcement/emoji_reaction/instance_announcement_emoji_reaction_model_adapter.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementEmojiReactionAdapterProxyProvider
    extends StatelessWidget {
  final Widget child;

  InstanceAnnouncementEmojiReactionAdapterProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IPleromaApiAnnouncementReaction, IEmojiReaction>(
      update: (context, value, previous) =>
          InstanceAnnouncementEmojiReactionAdapter(
        pleromaApiAnnouncementReaction: value,
      ),
      child: child,
    );
  }
}
