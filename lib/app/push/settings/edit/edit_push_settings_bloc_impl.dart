import 'package:fedi/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_bloc.dart';
import 'package:fedi/app/push/settings/push_settings_model.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc_impl.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EditPushSettingsBloc extends EditInstanceSettingsBloc<PushSettings?>
    implements IEditPushSettingsBloc {
  final IPushSettingsBloc pushSettingsBloc;
  final UnifediApiAccess? currentInstance;

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
  final IBoolValueFormFieldBloc chatMentionFieldBloc;
  @override
  final IBoolValueFormFieldBloc emojiReactionFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        favouriteFieldBloc,
        followFieldBloc,
        mentionFieldBloc,
        reblogFieldBloc,
        pollFieldBloc,
        chatMentionFieldBloc,
        emojiReactionFieldBloc,
      ];

  EditPushSettingsBloc({
    required this.pushSettingsBloc,
    required this.currentInstance,
    required bool isEnabled,
  })  : favouriteFieldBloc = BoolValueFormFieldBloc(
          originValue: pushSettingsBloc.favourite,
          isEnabled: isEnabled,
        ),
        followFieldBloc = BoolValueFormFieldBloc(
          originValue: pushSettingsBloc.follow,
          isEnabled: isEnabled,
        ),
        mentionFieldBloc = BoolValueFormFieldBloc(
          originValue: pushSettingsBloc.mention,
          isEnabled: isEnabled,
        ),
        reblogFieldBloc = BoolValueFormFieldBloc(
          originValue: pushSettingsBloc.reblog,
          isEnabled: isEnabled,
        ),
        pollFieldBloc = BoolValueFormFieldBloc(
          originValue: pushSettingsBloc.poll,
          isEnabled: isEnabled && currentInstance!.isMastodon, // only mastodon
        ),
        chatMentionFieldBloc = BoolValueFormFieldBloc(
          originValue: pushSettingsBloc.chatMention,
          isEnabled: isEnabled && currentInstance!.isPleroma,
        ),
        emojiReactionFieldBloc = BoolValueFormFieldBloc(
          originValue: pushSettingsBloc.emojiReaction,
          isEnabled: isEnabled && currentInstance!.isPleroma,
        ),
        super(
          isEnabled: isEnabled,
          settingsBloc: pushSettingsBloc,
          isAllItemsInitialized: true,
        ) {
    addDisposable(favouriteFieldBloc);
    addDisposable(followFieldBloc);
    addDisposable(mentionFieldBloc);
    addDisposable(reblogFieldBloc);
    addDisposable(pollFieldBloc);
    addDisposable(chatMentionFieldBloc);
    addDisposable(emojiReactionFieldBloc);
  }

  @override
  PushSettings calculateCurrentFormFieldsSettings() => PushSettings(
        favourite: favouriteFieldBloc.currentValue,
        follow: followFieldBloc.currentValue,
        mention: mentionFieldBloc.currentValue,
        reblog: reblogFieldBloc.currentValue,
        poll: pollFieldBloc.currentValue,
        chatMention: chatMentionFieldBloc.currentValue,
        emojiReaction: emojiReactionFieldBloc.currentValue,
      );

  @override
  Future<void> fillSettingsToFormFields(PushSettings? settings) async {
    favouriteFieldBloc.changeCurrentValue(
      settings!.favourite,
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
    chatMentionFieldBloc.changeCurrentValue(
      settings.chatMention,
    );
    emojiReactionFieldBloc.changeCurrentValue(
      settings.emojiReaction,
    );
  }
}
