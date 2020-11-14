import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class EditToastSettingsBloc extends EditGlobalOrInstanceSettingsBloc
    implements IEditToastSettingsBloc {
  final IToastSettingsBloc toastSettingBloc;

  @override
  final IFormBoolFieldBloc notificationForChatAndDmFieldBloc;

  @override
  final IFormBoolFieldBloc notificationForMentionFieldBloc;

  EditToastSettingsBloc({
    @required this.toastSettingBloc,
  })  : notificationForChatAndDmFieldBloc = FormBoolFieldBloc(
          originValue: toastSettingBloc.notificationForChatAndDm,
          isEnabled: toastSettingBloc.isInstance,
          isEnabledStream: toastSettingBloc.isInstanceStream,
        ),
        notificationForMentionFieldBloc = FormBoolFieldBloc(
          originValue: toastSettingBloc.notificationForMention,
          isEnabled: toastSettingBloc.isInstance,
          isEnabledStream: toastSettingBloc.isInstanceStream,
        ) {
    _subscribeForNotificationForMentionFieldBloc();
    _subscribeForNotificationForChatAndDm();
  }

  void _subscribeForNotificationForMentionFieldBloc() {
    addDisposable(
      streamSubscription: toastSettingBloc.notificationForMentionStream
          .distinct()
          .listen(
        (newValue) {
          notificationForMentionFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          notificationForMentionFieldBloc.currentValueStream.listen(
        (value) {
          toastSettingBloc.changeNotificationForMention(value);
        },
      ),
    );
  }

  void _subscribeForNotificationForChatAndDm() {
    addDisposable(
      streamSubscription:
          toastSettingBloc.notificationForChatAndDmStream.distinct().listen(
        (newValue) {
          notificationForChatAndDmFieldBloc.changeCurrentValue(newValue);
        },
      ),
    );
    addDisposable(
      streamSubscription:
          notificationForChatAndDmFieldBloc.currentValueStream.listen(
        (value) {
          toastSettingBloc.changeNotificationForChatAndDm(value);
        },
      ),
    );
  }
}
