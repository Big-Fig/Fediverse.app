import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../account/unifedi_api_account_model_impl.dart';
import 'unifedi_api_emoji_reaction_model.dart';
import 'unifedi_api_emoji_reaction_model_impl.dart';

extension IUnifediApiEmojiReactionListExtension
    on List<IUnifediApiEmojiReaction> {
  int sumUnifediApiEmojiReactions() => fold(
        0,
        (int previousValue, IUnifediApiEmojiReaction element) =>
            previousValue + element.count,
      );

  List<IUnifediApiEmojiReaction> mergeUnifediApiEmojiReactionsLists(
    List<IUnifediApiEmojiReaction>? emojiReactionsListToMerge,
  ) {
    if (emojiReactionsListToMerge?.isNotEmpty != true) {
      return this;
    }
    var mergedList = <IUnifediApiEmojiReaction>[];

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
          var mergedEmojiReaction = UnifediApiEmojiReaction(
            name: alreadyExistEmojiReaction.name,
            staticUrl: alreadyExistEmojiReaction.staticUrl,
            url: alreadyExistEmojiReaction.url,
            me: alreadyExistEmojiReaction.me || emojiReaction.me,
            count: alreadyExistEmojiReaction.count + emojiReaction.count,
            accounts: [
              ...alreadyExistEmojiReaction.accounts
                      ?.toUnifediApiAccountList() ??
                  [],
              ...emojiReaction.accounts?.toUnifediApiAccountList() ?? [],
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
