import 'package:fedi_app/app/push/settings/edit/edit_push_settings_bloc.dart';
import 'package:fedi_app/app/push/settings/push_settings_bloc.dart';
import 'package:fedi_app/app/push/settings/push_settings_model.dart';
import 'package:fedi_app/app/settings/instance/edit/edit_instance_settings_bloc_impl.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EditPushSettingsBloc extends EditInstanceSettingsBloc<PushSettings?>
    implements IEditPushSettingsBloc {
  final IPushSettingsBloc pushSettingsBloc;
  final UnifediApiAccess? currentInstance;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc favouriteFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc followFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc mentionFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc reblogFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc pollFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc chatMentionFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc emojiReactionFieldBloc;

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

  final IUnifediApiPushSubscriptionService unifediApiPushSubscriptionService;

  bool get isPollSupported =>
      currentInstance!.instance!.typeAsUnifediApi.isMastodon;

  bool get isChatMentionSupported =>
      unifediApiPushSubscriptionService.isFeatureSupported(
        unifediApiPushSubscriptionService.subscribeChatMentionFeature,
      );

  bool get isEmojiReactionSupported =>
      unifediApiPushSubscriptionService.isFeatureSupported(
        unifediApiPushSubscriptionService.subscribeEmojiReactionFeature,
      );

  EditPushSettingsBloc({
    required this.pushSettingsBloc,
    required this.currentInstance,
    required bool isEnabled,
    required this.unifediApiPushSubscriptionService,
  }) : super(
          isEnabled: isEnabled,
          settingsBloc: pushSettingsBloc,
          isAllItemsInitialized: false,
        ) {
    favouriteFieldBloc = BoolValueFormFieldBloc(
      originValue: pushSettingsBloc.favourite,
      isEnabled: isEnabled,
    );
    followFieldBloc = BoolValueFormFieldBloc(
      originValue: pushSettingsBloc.follow,
      isEnabled: isEnabled,
    );
    mentionFieldBloc = BoolValueFormFieldBloc(
      originValue: pushSettingsBloc.mention,
      isEnabled: isEnabled,
    );
    reblogFieldBloc = BoolValueFormFieldBloc(
      originValue: pushSettingsBloc.reblog,
      isEnabled: isEnabled,
    );
    pollFieldBloc = BoolValueFormFieldBloc(
      originValue: pushSettingsBloc.poll,
      isEnabled: isEnabled && isPollSupported, // only mastodon
    );
    chatMentionFieldBloc = BoolValueFormFieldBloc(
      originValue: pushSettingsBloc.chatMention,
      isEnabled: isEnabled && isChatMentionSupported,
    );
    emojiReactionFieldBloc = BoolValueFormFieldBloc(
      originValue: pushSettingsBloc.emojiReaction,
      isEnabled: isEnabled && isEmojiReactionSupported,
    );

    addDisposable(favouriteFieldBloc);
    addDisposable(followFieldBloc);
    addDisposable(mentionFieldBloc);
    addDisposable(reblogFieldBloc);
    addDisposable(pollFieldBloc);
    addDisposable(chatMentionFieldBloc);
    addDisposable(emojiReactionFieldBloc);

    onFormItemsChanged();
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
