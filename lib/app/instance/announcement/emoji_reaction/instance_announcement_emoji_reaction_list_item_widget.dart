import 'package:fedi/app/async/pleroma/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/emoji/reaction/emoji_reaction_widget.dart';
import 'package:fedi/app/instance/announcement/emoji_reaction/instance_announcement_emoji_reaction_model_adapter_proxy_provider.dart';
import 'package:fedi/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstanceAnnouncementEmojiReactionListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      InstanceAnnouncementEmojiReactionAdapterProxyProvider(
        child: const InstanceAnnouncementEmojiReactionListItemBodyWidget(),
      );

  const InstanceAnnouncementEmojiReactionListItemWidget();
}

class InstanceAnnouncementEmojiReactionListItemBodyWidget
    extends StatelessWidget {
  const InstanceAnnouncementEmojiReactionListItemBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(context);
    var pleromaApiAnnouncementReaction =
        Provider.of<IPleromaApiAnnouncementReaction>(context);

    return PleromaAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () => instanceAnnouncementBloc.toggleEmojiReaction(
        emojiName: pleromaApiAnnouncementReaction.name,
      ),
      builder: (BuildContext context, void Function()? onPressed) {
        return InkWell(
          onTap: onPressed,
          child: const EmojiReactionWidget(),
        );
      },
    );
  }
}
