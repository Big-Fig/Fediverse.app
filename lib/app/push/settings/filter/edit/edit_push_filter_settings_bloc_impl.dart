import 'package:fedi/app/push/settings/filter/edit/edit_push_filter_settings_bloc.dart';
import 'package:fedi/app/push/settings/filter/push_filter_settings_bloc.dart';
import 'package:fedi/app/push/settings/filter/push_filter_settings_model.dart';
import 'package:fedi/app/settings/instance/edit/edit_instance_settings_bloc_impl.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

class EditPushFilterSettingsBloc
    extends EditInstanceSettingsBloc<PushFilterSettings?>
    implements IEditPushFilterSettingsBloc {
  final IPushFilterSettingsBloc pushFilterSettingsBloc;
  final UnifediApiAccess? currentInstance;

  @override
  final IBoolValueFormFieldBloc hideNotificationContentsFieldBloc;
  @override
  final IBoolValueFormFieldBloc blockFromStrangersFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        hideNotificationContentsFieldBloc,
        blockFromStrangersFieldBloc,
      ];

  EditPushFilterSettingsBloc({
    required this.pushFilterSettingsBloc,
    required this.currentInstance,
    required bool isEnabled,
  })  : blockFromStrangersFieldBloc = BoolValueFormFieldBloc(
          originValue: pushFilterSettingsBloc.blockFromStrangers,
          isEnabled: isEnabled && currentInstance!.isPleroma, // only mastodon
        ),
        hideNotificationContentsFieldBloc = BoolValueFormFieldBloc(
          originValue: pushFilterSettingsBloc.hideNotificationContents,
          isEnabled: isEnabled && currentInstance!.isPleroma, // only mastodon
        ),
        super(
          isEnabled: isEnabled,
          settingsBloc: pushFilterSettingsBloc,
          isAllItemsInitialized: true,
        ) {
    addDisposable(blockFromStrangersFieldBloc);
    addDisposable(hideNotificationContentsFieldBloc);
  }

  @override
  PushFilterSettings calculateCurrentFormFieldsSettings() => PushFilterSettings(
        blockFromStrangers: blockFromStrangersFieldBloc.currentValue,
        hideNotificationContents:
            hideNotificationContentsFieldBloc.currentValue,
      );

  @override
  Future fillSettingsToFormFields(
    PushFilterSettings? settings,
  ) async {
    blockFromStrangersFieldBloc.changeCurrentValue(
      settings?.blockFromStrangers == true,
    );
    hideNotificationContentsFieldBloc.changeCurrentValue(
      settings?.hideNotificationContents == true,
    );
  }
}
