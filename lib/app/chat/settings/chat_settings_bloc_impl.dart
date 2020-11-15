import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_model.dart';
import 'package:fedi/app/chat/settings/local_preferences/chat_settings_local_preferences_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:flutter/widgets.dart';

class ChatSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<ChatSettings>
    implements IChatSettingsBloc {
  ChatSettingsBloc({
    @required IChatSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    @required IChatSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  void changeCountConversationsInChatsUnreadBadges(bool value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          countConversationsInChatsUnreadBadges: value,
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          countConversationsInChatsUnreadBadges: value,
        ),
      );
    }
  }

  @override
  void changeReplaceConversationsWithChats(bool value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          replaceConversationsWithChats: value,
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          replaceConversationsWithChats: value,
        ),
      );
    }
  }

  @override
  bool get countConversationsInChatsUnreadBadges =>
      settingsData.countConversationsInChatsUnreadBadges;

  @override
  Stream<bool> get countConversationsInChatsUnreadBadgesStream =>
      settingsDataStream
          .map((settings) => settings.countConversationsInChatsUnreadBadges);

  @override
  bool get replaceConversationsWithChats =>
      settingsData.replaceConversationsWithChats;

  @override
  Stream<bool> get replaceConversationsWithChatsStream => settingsDataStream
      .map((settings) => settings.replaceConversationsWithChats);
}
