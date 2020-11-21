import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc_impl.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditPushSettingsBloc extends EditInstanceSettingsBloc<PushSettings>
    implements IEditPushSettingsBloc {
  final IPushSettingsBloc pushSettingsBloc;

  @override
  final IBoolValueFormFieldBloc favouriteFieldBloc;
  @override
  final IBoolValueFormFieldBloc followFieldBloc;
  @override
  final IBoolValueFormFieldBloc mentionFieldBloc;
  @override
  final IBoolValueFormFieldBloc reblogFieldBloc;
  @override
  final IBoolValueFormFieldBloc pollFieldBloc;
  @override
  final IBoolValueFormFieldBloc pleromaChatMentionFieldBloc;
  @override
  final IBoolValueFormFieldBloc pleromaEmojiReactionFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        favouriteFieldBloc,
        followFieldBloc,
        mentionFieldBloc,
        reblogFieldBloc,
        pollFieldBloc,
        pleromaChatMentionFieldBloc,
        pleromaEmojiReactionFieldBloc,
      ];

  EditPushSettingsBloc({
    @required this.pushSettingsBloc,
    @required bool enabled,
  })  : favouriteFieldBloc =
            BoolValueFormFieldBloc(originValue: pushSettingsBloc.favourite),
        followFieldBloc =
            BoolValueFormFieldBloc(originValue: pushSettingsBloc.follow),
        mentionFieldBloc =
            BoolValueFormFieldBloc(originValue: pushSettingsBloc.mention),
        reblogFieldBloc =
            BoolValueFormFieldBloc(originValue: pushSettingsBloc.reblog),
        pollFieldBloc = BoolValueFormFieldBloc(originValue: pushSettingsBloc.poll),
        pleromaChatMentionFieldBloc =
            BoolValueFormFieldBloc(originValue: pushSettingsBloc.pleromaChatMention),
        pleromaEmojiReactionFieldBloc = BoolValueFormFieldBloc(
            originValue: pushSettingsBloc.pleromaEmojiReaction),
        super(
          enabled,
          pushSettingsBloc,
        ) {
    addDisposable(disposable: favouriteFieldBloc);
    addDisposable(disposable: followFieldBloc);
    addDisposable(disposable: mentionFieldBloc);
    addDisposable(disposable: reblogFieldBloc);
    addDisposable(disposable: pollFieldBloc);
    addDisposable(disposable: pleromaChatMentionFieldBloc);
    addDisposable(disposable: pleromaEmojiReactionFieldBloc);
  }

  @override
  PushSettings calculateCurrentFormFieldsSettings() => PushSettings(
        favourite: favouriteFieldBloc.currentValue,
        follow: followFieldBloc.currentValue,
        mention: mentionFieldBloc.currentValue,
        reblog: reblogFieldBloc.currentValue,
        poll: pollFieldBloc.currentValue,
        pleromaChatMention: pleromaChatMentionFieldBloc.currentValue,
        pleromaEmojiReaction: pleromaEmojiReactionFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(PushSettings settings) async {
    favouriteFieldBloc.changeCurrentValue(
      settings.favourite,
    );
    followFieldBloc.changeCurrentValue(
      settings.follow,
    );
    mentionFieldBloc.changeCurrentValue(
      settings.mention,
    );
    reblogFieldBloc.changeCurrentValue(
      settings.reblog,
    );
    pollFieldBloc.changeCurrentValue(
      settings.poll,
    );
    pleromaChatMentionFieldBloc.changeCurrentValue(
      settings.pleromaChatMention,
    );
    pleromaEmojiReactionFieldBloc.changeCurrentValue(
      settings.pleromaEmojiReaction,
    );
  }
}
