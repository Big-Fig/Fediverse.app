import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/emoji/reaction/emoji_reaction_widget.dart';
import 'package:fedi_app/app/instance/announcement/emoji_reaction/instance_announcement_emoji_reaction_model_adapter_proxy_provider.dart';
import 'package:fedi_app/app/instance/announcement/instance_announcement_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class InstanceAnnouncementEmojiReactionListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const InstanceAnnouncementEmojiReactionAdapterProxyProvider(
        child: InstanceAnnouncementEmojiReactionListItemBodyWidget(),
      );

  const InstanceAnnouncementEmojiReactionListItemWidget({
    Key? key,
  }) : super(key: key);
}

class InstanceAnnouncementEmojiReactionListItemBodyWidget
    extends StatelessWidget {
  const InstanceAnnouncementEmojiReactionListItemBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instanceAnnouncementBloc = IInstanceAnnouncementBloc.of(context);
    var unifediApiEmojiReaction =
        Provider.of<IUnifediApiEmojiReaction>(context);

    return UnifediAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () => instanceAnnouncementBloc.toggleEmojiReaction(
        emojiName: unifediApiEmojiReaction.name,
      ),
      builder: (BuildContext context, void Function()? onPressed) => InkWell(
        onTap: onPressed,
        child: const EmojiReactionWidget(),
      ),
    );
  }
}
