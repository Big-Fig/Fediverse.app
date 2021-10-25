import 'package:fedi_app/app/instance/announcement/settings/edit/edit_instance_announcement_settings_bloc.dart';
import 'package:fedi_app/app/instance/announcement/settings/instance_announcement_settings_bloc.dart';
import 'package:fedi_app/app/instance/announcement/settings/instance_announcement_settings_model.dart';
import 'package:fedi_app/app/settings/instance/edit/edit_instance_settings_bloc_impl.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class EditInstanceAnnouncementSettingsBloc
    extends EditInstanceSettingsBloc<InstanceAnnouncementSettings?>
    implements IEditInstanceAnnouncementSettingsBloc {
  final IInstanceAnnouncementSettingsBloc instanceAnnouncementSettingsBloc;

  @override
  final IBoolValueFormFieldBloc withDismissedFieldBloc;

  @override
  List<IFormItemBloc> get currentItems => [
        withDismissedFieldBloc,
      ];

  EditInstanceAnnouncementSettingsBloc({
    required this.instanceAnnouncementSettingsBloc,
    required bool isEnabled,
  })  : withDismissedFieldBloc = BoolValueFormFieldBloc(
          originValue: instanceAnnouncementSettingsBloc.withDismissed,
          isEnabled: isEnabled,
        ),
        super(
          isEnabled: isEnabled,
          settingsBloc: instanceAnnouncementSettingsBloc,
          isAllItemsInitialized: true,
        ) {
    addDisposable(withDismissedFieldBloc);
  }

  @override
  InstanceAnnouncementSettings calculateCurrentFormFieldsSettings() =>
      InstanceAnnouncementSettings(
        withDismissed: withDismissedFieldBloc.currentValue!,
      );

  @override
  Future<void> fillSettingsToFormFields(
    InstanceAnnouncementSettings? settings,
  ) async {
    withDismissedFieldBloc.changeCurrentValue(
      settings!.withDismissed,
    );
  }
}
