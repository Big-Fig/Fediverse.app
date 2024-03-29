import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/emoji/reaction/emoji_reaction_widget.dart';
import 'package:fedi_app/app/instance/location/instance_location_model.dart';
import 'package:fedi_app/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:fedi_app/app/status/emoji_reaction/status_emoji_reaction_model_adapter_proxy_provider.dart';
import 'package:fedi_app/app/status/status_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

class StatusEmojiReactionListItemWidget extends StatelessWidget {
  const StatusEmojiReactionListItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusEmojiReactionBloc = IStatusEmojiReactionBloc.of(context);

    return StreamBuilder<IUnifediApiEmojiReaction>(
      stream: statusEmojiReactionBloc.emojiReactionStream,
      builder: (context, snapshot) {
        var emojiReaction = snapshot.data;

        if (emojiReaction == null) {
          // may occurs when user delete own reaction when new count is 0
          return const SizedBox.shrink();
        }

        return Provider<IUnifediApiEmojiReaction>.value(
          value: emojiReaction,
          child: const _StatusEmojiReactionListItemBodyWidget(),
        );
      },
    );
  }
}

class _StatusEmojiReactionListItemBodyWidget extends StatelessWidget {
  const _StatusEmojiReactionListItemBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var statusEmojiReactionBloc = IStatusEmojiReactionBloc.of(context);

    var statusBloc = IStatusBloc.of(context);

    var isLocal = statusBloc.instanceLocation == InstanceLocation.local;

    Widget child;
    if (isLocal) {
      child = UnifediAsyncOperationButtonBuilderWidget(
        showProgressDialog: false,
        asyncButtonAction: () => statusEmojiReactionBloc.toggleEmojiReaction(),
        builder: (BuildContext context, void Function()? onPressed) => InkWell(
          onTap: onPressed,
          child: const EmojiReactionWidget(),
        ),
      );
    } else {
      child = const EmojiReactionWidget();
    }

    return StatusEmojiReactionAdapterProxyProvider(
      child: child,
    );
  }
}
