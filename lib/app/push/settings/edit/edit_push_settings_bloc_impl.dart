import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditPushSettingsBloc extends DisposableOwner
    implements IEditPushSettingsBloc {
  final IPushSettingsBloc pushSettingsBloc;

  @override
  final IFormBoolFieldBloc favouriteFieldBloc;
  @override
  final IFormBoolFieldBloc followFieldBloc;
  @override
  final IFormBoolFieldBloc mentionFieldBloc;
  @override
  final IFormBoolFieldBloc reblogFieldBloc;
  @override
  final IFormBoolFieldBloc pollFieldBloc;
  @override
  final IFormBoolFieldBloc pleromaChatMentionFieldBloc;
  @override
  final IFormBoolFieldBloc pleromaEmojiReactionFieldBloc;

  EditPushSettingsBloc({
    @required this.pushSettingsBloc,
  })  : favouriteFieldBloc =
            FormBoolFieldBloc(originValue: pushSettingsBloc.favourite),
        followFieldBloc =
            FormBoolFieldBloc(originValue: pushSettingsBloc.follow),
        mentionFieldBloc =
            FormBoolFieldBloc(originValue: pushSettingsBloc.mention),
        reblogFieldBloc =
            FormBoolFieldBloc(originValue: pushSettingsBloc.reblog),
        pollFieldBloc = FormBoolFieldBloc(originValue: pushSettingsBloc.poll),
        pleromaChatMentionFieldBloc =
            FormBoolFieldBloc(originValue: pushSettingsBloc.pleromaChatMention),
        pleromaEmojiReactionFieldBloc = FormBoolFieldBloc(
            originValue: pushSettingsBloc.pleromaEmojiReaction) {
    addDisposable(disposable: favouriteFieldBloc);
    addDisposable(disposable: followFieldBloc);
    addDisposable(disposable: mentionFieldBloc);
    addDisposable(disposable: reblogFieldBloc);
    addDisposable(disposable: pollFieldBloc);
    addDisposable(disposable: pleromaChatMentionFieldBloc);
    addDisposable(disposable: pleromaEmojiReactionFieldBloc);

    _subscribeForFavourite();
    _subscribeForFollow();
    _subscribeForMention();
    _subscribeForReblog();
    _subscribeForPoll();
    _subscribeForPleromaChatMention();
    _subscribeForPleromaEmojiReaction();
  }

  void _subscribeForFavourite() {
    addDisposable(
      streamSubscription: pushSettingsBloc.favouriteStream.listen(
        (newValue) {
          favouriteFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          favouriteFieldBloc.currentValueStream.listen(
        (value) {
          pushSettingsBloc.changeFavourite(value);
        },
      ),
    );
  }

  void _subscribeForFollow() {
    addDisposable(
      streamSubscription: pushSettingsBloc.followStream.listen(
        (newValue) {
          followFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: followFieldBloc.currentValueStream.listen(
        (value) {
          pushSettingsBloc.changeFollow(value);
        },
      ),
    );
  }

  void _subscribeForMention() {
    addDisposable(
      streamSubscription: pushSettingsBloc.mentionStream.listen(
        (newValue) {
          mentionFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: mentionFieldBloc.currentValueStream.listen(
        (value) {
          pushSettingsBloc.changeMention(value);
        },
      ),
    );
  }

  void _subscribeForReblog() {
    addDisposable(
      streamSubscription: pushSettingsBloc.reblogStream.listen(
        (newValue) {
          reblogFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: reblogFieldBloc.currentValueStream.listen(
        (value) {
          pushSettingsBloc.changeReblog(value);
        },
      ),
    );
  }

  void _subscribeForPoll() {
    addDisposable(
      streamSubscription: pushSettingsBloc.pollStream.listen(
        (newValue) {
          pollFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: pollFieldBloc.currentValueStream.listen(
        (value) {
          pushSettingsBloc.changePoll(value);
        },
      ),
    );
  }

  void _subscribeForPleromaChatMention() {
    addDisposable(
      streamSubscription:
          pushSettingsBloc.pleromaChatMentionStream.listen(
        (newValue) {
          pleromaChatMentionFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          pleromaChatMentionFieldBloc.currentValueStream.listen(
        (value) {
          pushSettingsBloc.changePleromaChatMention(value);
        },
      ),
    );
  }

  void _subscribeForPleromaEmojiReaction() {
    addDisposable(
      streamSubscription:
          pushSettingsBloc.pleromaEmojiReactionStream.listen(
        (newValue) {
          pleromaEmojiReactionFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          pleromaEmojiReactionFieldBloc.currentValueStream.listen(
        (value) {
          pushSettingsBloc.changePleromaEmojiReaction(value);
        },
      ),
    );
  }
}
