import 'dart:async';
import 'package:fedi/Pleroma/Foundation/Client.dart';
import 'package:fedi/Pleroma/Foundation/CurrentInstance.dart';
import 'package:fedi/Pleroma/Foundation/Requests/Status.dart' as StatusRequest;
import 'package:fedi/Pleroma/Models/emoji_reaction.dart';
import 'package:fedi/Pleroma/Models/Status.dart';
import 'package:rxdart/rxdart.dart';
import 'package:fedi/disposable/disposable.dart';

class EmojiBottomSheetBloc implements Disposable {
  final _status = BehaviorSubject<Status>.seeded(null);
  final _statusUpdated = BehaviorSubject<Function>.seeded(null);
  Stream<Status> get getStatus => _status.stream;
  Function(Status) get addReactionToBottom => _status.sink.add;
  Function(Function) get addUpdateFunction => _statusUpdated.sink.add;

  addRemoveReaction(String emoji) {
    if (_status.value.statusPleroma == null){
      return;
    }
    int firstIndex;
    if (_status.value.statusPleroma.emojiReactions != null) {
      firstIndex =
          _status.value.statusPleroma.emojiReactions.indexWhere((emojiReaction) {
        return emojiReaction.name == emoji;
      });
    } else {
      _status.value.statusPleroma.emojiReactions = [];
    }

    print(firstIndex);

    EmojiReaction newReaction;
    if (firstIndex == null || firstIndex == -1) {
      newReaction = EmojiReaction(count: 1, me: true, name: emoji);
      _status.value.statusPleroma.emojiReactions.add(newReaction);
      putReaction(emoji);
    } else {
      newReaction = _status.value.statusPleroma.emojiReactions[firstIndex];
      print(firstIndex);
      if (newReaction.me) {
        newReaction.count -= 1;
        deleteReaction(emoji);
        if (newReaction.count == 0) {
          _status.value.statusPleroma.emojiReactions.removeAt(firstIndex);
        }
      } else {
        newReaction.count += 1;
        putReaction(emoji);
      }

      newReaction.me = !newReaction.me;
    }
    _statusUpdated.stream.value();
  }

  putReaction(String emoji) {
    String path = StatusRequest.Status.putReaction(_status.value.id, emoji);
    CurrentInstance.instance.currentClient
        .run(path: path, method: HTTPMethod.PUT)
        .then((registerResopnse) {});
  }

  deleteReaction(String emoji) {
    String path = StatusRequest.Status.deleteReaction(_status.value.id, emoji);
    CurrentInstance.instance.currentClient
        .run(path: path, method: HTTPMethod.DELETE)
        .then((registerResopnse) {});
  }

  @override
  void dispose() {
    _status.close();
    _statusUpdated.close();
  }
}
