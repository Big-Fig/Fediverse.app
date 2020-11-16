import 'package:fedi/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:fedi/ui/form/form_item_validation.dart';
import 'package:flutter/widgets.dart';

abstract class EditGlobalOrInstanceSettingsBloc extends DisposableOwner
    implements IEditGlobalOrInstanceSettingsBloc {
  final IGlobalOrInstanceSettingsBloc globalOrInstanceSettingsBloc;

  EditGlobalOrInstanceSettingsBloc(
    this.globalOrInstanceSettingsBloc,
  ) : isUseGlobalSettingsFormBoolField = IsUseGlobalSettingsFormBoolField(
          globalOrInstanceSettingsBloc: globalOrInstanceSettingsBloc,
        ) {
    addDisposable(disposable: isUseGlobalSettingsFormBoolField);
  }

  @override
  final IFormBoolFieldBloc isUseGlobalSettingsFormBoolField;
}

class IsUseGlobalSettingsFormBoolField implements IFormBoolFieldBloc {
  final IGlobalOrInstanceSettingsBloc globalOrInstanceSettingsBloc;

  IsUseGlobalSettingsFormBoolField({
    @required this.globalOrInstanceSettingsBloc,
  });

  @override
  void changeCurrentValue(bool isUseGlobalSettings) {
    if (isUseGlobalSettings) {
      globalOrInstanceSettingsBloc.clearInstanceSettings();
    } else {
      globalOrInstanceSettingsBloc.cloneGlobalToInstanceSettings();
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
  // TODO: implement errorsStream
  Stream<List<FormItemValidationError>> get errorsStream =>
      Stream.value(errors);

  @override
  bool get isEnabled => true;

  @override
  Stream<bool> get isEnabledStream => Stream.value(isEnabled);

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
        "updateValidators not supported in IsUseGlobalSettingsFormBoolField");
  }

  @override
  List<FormValueFieldValidation<bool>> get validators => [];
}
