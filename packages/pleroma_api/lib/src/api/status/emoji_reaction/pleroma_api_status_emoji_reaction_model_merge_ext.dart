import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import './pleroma_api_status_emoji_reaction_model_impl.dart';
import '../../account/pleroma_api_account_model_impl.dart';
import 'pleroma_api_status_emoji_reaction_model.dart';

extension IPleromaApiStatusEmojiReactionListExtension
    on List<IPleromaApiStatusEmojiReaction> {
  int sumPleromaApiEmojiReactions() => fold(
        0,
        (int previousValue, IPleromaApiStatusEmojiReaction element) =>
            previousValue + element.count,
      );

  List<IPleromaApiStatusEmojiReaction> mergePleromaApiEmojiReactionsLists(
    List<IPleromaApiStatusEmojiReaction>? emojiReactionsListToMerge,
  ) {
    if (emojiReactionsListToMerge?.isNotEmpty != true) {
      return this;
    }
    var mergedList = <IPleromaApiStatusEmojiReaction>[];

    // ignore: cascade_invocations
    mergedList.addAll(this);

    if (emojiReactionsListToMerge != null) {
      for (final emojiReaction in emojiReactionsListToMerge) {
        var alreadyExistEmojiReaction = mergedList.firstWhereOrNull(
          (currentEmojiReaction) =>
              currentEmojiReaction.name == emojiReaction.name,
        );

        if (alreadyExistEmojiReaction != null) {
          // ignore: avoid-ignoring-return-values
          mergedList.remove(alreadyExistEmojiReaction);
          var mergedEmojiReaction = PleromaApiStatusEmojiReaction(
            name: alreadyExistEmojiReaction.name,
            staticUrl: alreadyExistEmojiReaction.staticUrl,
            url: alreadyExistEmojiReaction.url,
            me: alreadyExistEmojiReaction.me || emojiReaction.me,
            count: alreadyExistEmojiReaction.count + emojiReaction.count,
            accounts: [
              ...alreadyExistEmojiReaction.accounts
                      ?.toPleromaApiAccountList() ??
                  [],
              ...emojiReaction.accounts?.toPleromaApiAccountList() ?? [],
            ],
          );
          mergedList.add(mergedEmojiReaction);
        } else {
          mergedList.add(emojiReaction);
        }
      }
    }

    return mergedList;
  }
}
