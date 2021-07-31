import 'package:fedi/app/instance/announcement/emoji_reaction/instance_announcement_emoji_reaction_list_item_widget.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementEmojiReactionListWidget extends StatelessWidget {
  const InstanceAnnouncementEmojiReactionListWidget();

  @override
  Widget build(BuildContext context) {
    var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(context);

    return StreamBuilder<List<IPleromaApiAnnouncementReaction>?>(
      stream: instanceAnnouncementBloc.reactionsStream,
      initialData: instanceAnnouncementBloc.reactions,
      builder: (context, snapshot) {
        var reactions = snapshot.data;

        return Provider<List<IPleromaApiAnnouncementReaction>?>.value(
          value: reactions,
          child: const _InstanceAnnouncementEmojiReactionListBodyWidget(),
        );
      },
    );
  }
}

class _InstanceAnnouncementEmojiReactionListBodyWidget extends StatelessWidget {
  const _InstanceAnnouncementEmojiReactionListBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reactions =
        Provider.of<List<IPleromaApiAnnouncementReaction>?>(context);

    if (reactions?.isNotEmpty == true) {
      return Padding(
        padding: const EdgeInsets.only(top: FediSizes.smallPadding),
        child: Row(
          children: reactions!
              .map(
                (reaction) => Provider<IPleromaApiAnnouncementReaction>.value(
                  value: reaction,
                  child:
                      const InstanceAnnouncementEmojiReactionListItemWidget(),
                ),
              )
              .toList(),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
