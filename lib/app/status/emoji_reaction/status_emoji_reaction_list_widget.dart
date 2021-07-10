import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/instance/location/instance_location_model.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_bloc.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_bloc_impl.dart';
import 'package:fedi/app/status/emoji_reaction/status_emoji_reaction_list_item_widget.dart';
import 'package:fedi/app/status/repository/status_repository.dart';
import 'package:fedi/app/status/status_bloc.dart';
import 'package:fedi/app/ui/fedi_padding.dart';
import 'package:fedi/app/ui/fedi_sizes.dart';
import 'package:fedi/pleroma/api/status/emoji_reaction/pleroma_api_status_emoji_reaction_service.dart';
import 'package:fedi/pleroma/api/status/pleroma_api_status_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusEmojiReactionListWidget extends StatelessWidget {
  const StatusEmojiReactionListWidget();

  @override
  Widget build(BuildContext context) {
    var statusBloc = IStatusBloc.of(context);

    return StreamBuilder<List<IPleromaApiStatusEmojiReaction>?>(
      stream: statusBloc.reblogPlusOriginalEmojiReactionsStream,
      builder: (context, snapshot) {
        var emojiReactions = snapshot.data;
        if (emojiReactions?.isNotEmpty == true) {
          return Padding(
            padding: FediPadding.allSmallPadding,
            child: Container(
              alignment: Alignment.topLeft,
              child: Wrap(
                runSpacing: FediSizes.smallPadding,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: emojiReactions!
                    .map(
                      (emojiReaction) =>
                          Provider<IPleromaApiStatusEmojiReaction>.value(
                        value: emojiReaction,
                        child: DisposableProxyProvider<
                            IPleromaApiStatusEmojiReaction,
                            IStatusEmojiReactionBloc>(
                          update: (context, value, previous) {
                            if (statusBloc.instanceLocation ==
                                InstanceLocation.local) {
                              return AuthStatusEmojiReactionBloc(
                                status: statusBloc.status,
                                emojiReaction: value,
                                statusRepository: IStatusRepository.of(
                                  context,
                                  listen: false,
                                ),
                                pleromaApiStatusEmojiReactionService:
                                    IPleromaApiStatusEmojiReactionService.of(
                                  context,
                                  listen: false,
                                ),
                              );
                            } else {
                              return StatusEmojiReactionBloc(
                                status: statusBloc.status,
                                emojiReaction: value,
                              );
                            }
                          },
                          child: const StatusEmojiReactionListItemWidget(),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
