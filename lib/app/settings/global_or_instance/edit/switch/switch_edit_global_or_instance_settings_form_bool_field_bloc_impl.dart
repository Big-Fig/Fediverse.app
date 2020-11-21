import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_form_bool_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/form/field/value/form_value_field_validation.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

final _logger = Logger(
    "switch_edit_global_or_instance_settings_form_bool_field_bloc_impl.dart");

class IsUseGlobalSettingsFormBoolFieldBloc
    implements IIsUseGlobalSettingsFormBoolFieldBloc {
  final IGlobalOrInstanceSettingsBloc globalOrInstanceSettingsBloc;

  IsUseGlobalSettingsFormBoolFieldBloc({
    @required this.globalOrInstanceSettingsBloc,
  });

  @override
  void changeCurrentValue(bool newValue) {
    var oldValue = currentValue;
    _logger.finest(() => "changeCurrentValue $newValue oldValue $oldValue");

    if (newValue != oldValue) {
      if (newValue) {
        globalOrInstanceSettingsBloc.clearInstanceSettings();
      } else {
        globalOrInstanceSettingsBloc.cloneGlobalToInstanceSettings();
      }
    }
  }

  @override
  void clear() {
    changeCurrentValue(true);
  }

  @override
  bool get currentValue => globalOrInstanceSettingsBloc.isGlobal;

  @override
  Stream<bool> get currentValueStream =>
      globalOrInstanceSettingsBloc.isGlobalStream;

  @override
  Future dispose() async {
    // nothing
  }

  @override
  List<FormItemValidationError> get errors => [];

  @override
  Stream<List<FormItemValidationError>> get errorsStream =>
      Stream.value(errors);

  @override
  bool get isHaveAtLeastOneError => false;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream =>
      Stream.value(isHaveAtLeastOneError);

  @override
  bool get isSomethingChanged => false;

  @override
  Stream<bool> get isSomethingChangedStream => Stream.value(isSomethingChanged);

  @override
  bool get originValue => false;

  @override
  void updateValidators(List<FormValueFieldValidation<bool>> validators) {
    throw UnsupportedError(
        "updateValidators not supported in IsUseGlobalSettingsFormBoolFieldBloc");
  }

  @override
  List<FormValueFieldValidation<bool>> get validators => [];
}
