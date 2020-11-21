import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc_impl.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/toast/settings/edit/edit_toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_bloc.dart';
import 'package:fedi/app/toast/settings/toast_settings_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:flutter/widgets.dart';

class EditToastSettingsBloc
    extends EditGlobalOrInstanceSettingsBloc<ToastSettings>
    implements IEditToastSettingsBloc {
  final IToastSettingsBloc toastSettingsBloc;

  @override
  IBoolValueFormFieldBloc notificationForChatAndDmFieldBloc;

  @override
  IBoolValueFormFieldBloc notificationForMentionFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        notificationForChatAndDmFieldBloc,
        notificationForMentionFieldBloc,
      ];

  EditToastSettingsBloc({
    @required this.toastSettingsBloc,
    @required GlobalOrInstanceSettingsType globalOrInstanceSettingsType,
    @required bool enabled,
  }) : super(
          globalOrInstanceSettingsBloc: toastSettingsBloc,
          globalOrInstanceSettingsType: globalOrInstanceSettingsType,
          enabled: enabled,
        ) {
    notificationForChatAndDmFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.notificationForChatAndDm,
    );

    notificationForMentionFieldBloc = BoolValueFormFieldBloc(
      originValue: currentSettings.notificationForMention,
    );
    addDisposable(disposable: notificationForChatAndDmFieldBloc);
    addDisposable(disposable: notificationForMentionFieldBloc);
  }

  @override
  ToastSettings calculateCurrentFormFieldsSettings() => ToastSettings(
        notificationForMention: notificationForMentionFieldBloc.currentValue,
        notificationForChatAndDm:
            notificationForChatAndDmFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(ToastSettings settings) async {
    notificationForMentionFieldBloc.changeCurrentValue(
      settings.notificationForMention,
    );
    notificationForChatAndDmFieldBloc.changeCurrentValue(
      settings.notificationForChatAndDm,
    );
  }
}
