import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi_app/app/chat/settings/chat_settings_model.dart';
import 'package:fedi_app/app/chat/settings/edit/edit_chat_settings_bloc.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class EditChatSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<ChatSettings>
    implements IEditChatSettingsBloc {
  final IChatSettingsBloc chatSettingsBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc countConversationsInChatsUnreadBadgesFieldBloc;

  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc replaceConversationsWithUnifediChatsFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        countConversationsInChatsUnreadBadgesFieldBloc,
        replaceConversationsWithUnifediChatsFieldBloc,
      ];

  EditChatSettingsBloc({
    required this.chatSettingsBloc,
    required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    required bool isEnabled,
    required bool isGlobalForced,
  }) : super(
          globalOrInstanceSettingsBloc: chatSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          isEnabled: isEnabled,
          isAllItemsInitialized: false,
          isGlobalForced: isGlobalForced,
        ) {
    countConversationsInChatsUnreadBadgesFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.countConversationsInChatsUnreadBadges,
      isEnabled: isEnabled,
    )..disposeWith(this);
    replaceConversationsWithUnifediChatsFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.replaceConversationsWithUnifediChats,
      isEnabled: isEnabled,
    )..disposeWith(this);
    onFormItemsChanged();
  }

  @override
  ChatSettings calculateCurrentFormFieldsSettings() => ChatSettings(
        countConversationsInChatsUnreadBadges:
            countConversationsInChatsUnreadBadgesFieldBloc.currentValue!,
        replaceConversationsWithUnifediChats:
            replaceConversationsWithUnifediChatsFieldBloc.currentValue!,
      );

  @override
  Future<void> fillSettingsToFormFields(ChatSettings? settings) async {
    countConversationsInChatsUnreadBadgesFieldBloc.changeCurrentValue(
      settings?.countConversationsInChatsUnreadBadges,
    );
    replaceConversationsWithUnifediChatsFieldBloc.changeCurrentValue(
      settings?.replaceConversationsWithUnifediChats,
    );
  }
}
