import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_bloc_impl.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_list_item_widget.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/pleroma/status/emoji_reaction/pleroma_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/status/pleroma_status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusEmojiReactionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context, listen: false);

    return StreamBuilder<List<IPleromaStatusEmojiReaction>>(
      stream: statusBloc.reblogPlusOriginalEmojiReactionsStream,
      initialData: statusBloc.reblogPlusOriginalPleromaEmojiReactions,
      builder: (context, snapshot) {
        var emojiReactions = snapshot.data;
        if (emojiReactions?.isNotEmpty == true) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.topLeft,
                child: Wrap(
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: emojiReactions
                      .map((emojiReaction) =>
                          Provider<IPleromaStatusEmojiReaction>.value(
                            value: emojiReaction,
                            child: DisposableProxyProvider<
                                    IPleromaStatusEmojiReaction,
                                    IStatusEmojiReactionBloc>(
                                update: (context, value, previous) =>
                                    StatusEmojiReactionBloc(
                                        status: statusBloc.status,
                                        statusRepository: IStatusRepository.of(
                                            context,
                                            listen: false),
                                        emojiReaction: value,
                                        pleromaStatusEmojiReactionService:
                                            IPleromaStatusEmojiReactionService
                                                .of(context, listen: false)),
                                child: StatusEmojiReactionListItemWidget()),
                          ))
                      .toList(),
                )),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }

  StatusEmojiReactionListWidget();
}
