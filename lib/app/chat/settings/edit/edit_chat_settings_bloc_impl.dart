import 'package:fedi/app/chat/settings/edit/edit_chat_settings_bloc.dart';
import 'package:fedi/app/chat/settings/chat_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditChatSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditChatSettingsBloc {
  final IChatSettingsBloc chatSettingBloc;

  @override
  final IFormBoolFieldBloc countConversationsInChatsUnreadBadgesFieldBloc;

  @override
  final IFormBoolFieldBloc replaceConversationsWithChatsFieldBloc;

  EditChatSettingsBloc({
    @required this.chatSettingBloc,
  })  : countConversationsInChatsUnreadBadgesFieldBloc = FormBoolFieldBloc(
          originValue: chatSettingBloc.countConversationsInChatsUnreadBadges,
          isEnabled: chatSettingBloc.isInstance,
          isEnabledStream: chatSettingBloc.isInstanceStream,
        ),
        replaceConversationsWithChatsFieldBloc = FormBoolFieldBloc(
          originValue: chatSettingBloc.replaceConversationsWithChats,
          isEnabled: chatSettingBloc.isInstance,
          isEnabledStream: chatSettingBloc.isInstanceStream,
        ) {
    _subscribeForReplaceConversationsWithChatsFieldBloc();
    _subscribeForCountConversationsInChatsUnreadBadges();
  }

  void _subscribeForReplaceConversationsWithChatsFieldBloc() {
    addDisposable(
      streamSubscription:
          chatSettingBloc.replaceConversationsWithChatsStream.distinct().listen(
        (newValue) {
          replaceConversationsWithChatsFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: replaceConversationsWithChatsFieldBloc.currentValueStream.listen(
        (value) {
          chatSettingBloc.changeReplaceConversationsWithChats(value);
        },
      ),
    );
  }

  void _subscribeForCountConversationsInChatsUnreadBadges() {
    addDisposable(
      streamSubscription:
          chatSettingBloc.countConversationsInChatsUnreadBadgesStream.distinct().listen(
        (newValue) {
          countConversationsInChatsUnreadBadgesFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription: countConversationsInChatsUnreadBadgesFieldBloc.currentValueStream.listen(
        (value) {
          chatSettingBloc.changeCountConversationsInChatsUnreadBadges(value);
        },
      ),
    );
  }
}
