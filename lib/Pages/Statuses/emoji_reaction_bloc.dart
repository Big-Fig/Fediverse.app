import 'dart:async';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:fedi/Pleroma/Models/emoji_reaction.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:rxdart/rxdart.dart';
import 'package:fedi/disposable/disposable.dart';

class EmojiReactionBloc implements Disposable {
  final Status status;
  EmojiReactionBloc({this.status}) {
    _reactions.sink.add(this.status.statusPleroma.emojiReactions);
  }

  final _reactions = BehaviorSubject<List<EmojiReaction>>.seeded([]);
  Stream<List<EmojiReaction>> get getReactions => _reactions.stream;
  Function(List<EmojiReaction>) get updateReactions => _reactions.sink.add;

  addRemoveReaction(String emoji) {
    int firstIndex;
    if (status.statusPleroma.emojiReactions != null) {
      firstIndex =
          status.statusPleroma.emojiReactions.indexWhere((emojiReaction) {
        return emojiReaction.name == emoji;
      });
    } else {
      status.statusPleroma.emojiReactions = [];
    }

    print(firstIndex);

    EmojiReaction newReaction;
    if (firstIndex == null || firstIndex == -1) {
      newReaction = EmojiReaction(count: 1, me: true, name: emoji);
      status.statusPleroma.emojiReactions.add(newReaction);
      putReaction(emoji);
    } else {
      newReaction = status.statusPleroma.emojiReactions[firstIndex];
      print(firstIndex);
      if (newReaction.me) {
        newReaction.count -= 1;
        deleteReaction(emoji);
        if (newReaction.count == 0) {
          status.statusPleroma.emojiReactions.removeAt(firstIndex);
        }
      } else {
        newReaction.count += 1;
        putReaction(emoji);
      }

      newReaction.me = !newReaction.me;
    }
    updateReactions(status.statusPleroma.emojiReactions);
  }

  putReaction(String emoji) {
    String path = StatusRequest.Status.putReaction(status.id, emoji);
    CurrentInstance.instance.currentClient
        .run(path: path, method: HTTPMethod.PUT)
        .then((registerResopnse) {});
  }

  deleteReaction(String emoji) {
    String path = StatusRequest.Status.deleteReaction(status.id, emoji);
    CurrentInstance.instance.currentClient
        .run(path: path, method: HTTPMethod.DELETE)
        .then((registerResopnse) {});
  }

  @override
  void dispose() {
    _reactions.close();
  }
}
