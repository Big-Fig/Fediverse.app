import 'package:fedi/app/chat/settings/edit/edit_chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditChatSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditChatSettingsBloc {
  final IChatSettingsBloc chatSettingsBloc;

  @override
  final IFormBoolFieldBloc countConversationsInChatsUnreadBadgesFieldBloc;

  @override
  final IFormBoolFieldBloc replaceConversationsWithPleromaChatsFieldBloc;

  EditChatSettingsBloc({
    @required this.chatSettingsBloc,
  })  : countConversationsInChatsUnreadBadgesFieldBloc = FormBoolFieldBloc(
          originValue: chatSettingsBloc.countConversationsInChatsUnreadBadges,
          isEnabled: chatSettingsBloc.isInstance,
          isEnabledStream: chatSettingsBloc.isInstanceStream,
        ),
        replaceConversationsWithPleromaChatsFieldBloc = FormBoolFieldBloc(
          originValue: chatSettingsBloc.replaceConversationsWithChats,
          isEnabled: chatSettingsBloc.isInstance,
          isEnabledStream: chatSettingsBloc.isInstanceStream,
        ), super(chatSettingsBloc) {
    _subscribeForReplaceConversationsWithChatsFieldBloc();
    _subscribeForCountConversationsInChatsUnreadBadges();
  }

  void _subscribeForReplaceConversationsWithChatsFieldBloc() {
    addDisposable(
      streamSubscription:
          chatSettingsBloc.replaceConversationsWithChatsStream.distinct().listen(
        (newValue) {
          replaceConversationsWithPleromaChatsFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: replaceConversationsWithPleromaChatsFieldBloc.currentValueStream.listen(
        (value) {
          chatSettingsBloc.changeReplaceConversationsWithPleromaChats(value);
        },
      ),
    );
  }

  void _subscribeForCountConversationsInChatsUnreadBadges() {
    addDisposable(
      streamSubscription:
          chatSettingsBloc.countConversationsInChatsUnreadBadgesStream.distinct().listen(
        (newValue) {
          countConversationsInChatsUnreadBadgesFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: countConversationsInChatsUnreadBadgesFieldBloc.currentValueStream.listen(
        (value) {
          chatSettingsBloc.changeCountConversationsInChatsUnreadBadges(value);
        },
      ),
    );
  }
}
