import 'package:easy_dispose_rxdart/easy_dispose_rxdart.dart';
import 'package:fedi/app/settings/global_or_instance/edit/switch/switch_edit_global_or_instance_settings_bool_value_form_field_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/form/field/form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:fedi/form/form_item_validation.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

final _logger = Logger(
  'switch_edit_global_or_instance_settings_form_bool_field_bloc_impl.dart',
);

class SwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc
    extends FormFieldBloc
    implements ISwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc {
  final IGlobalOrInstanceSettingsBloc globalOrInstanceSettingsBloc;

  final BehaviorSubject<bool?> currentValueSubject;

  final BehaviorSubject<GlobalOrInstanceSettingsType?>
      globalOrInstanceSettingsTypeSubject;

  @override
  GlobalOrInstanceSettingsType? get globalOrInstanceSettingsType =>
      globalOrInstanceSettingsTypeSubject.value;

  @override
  Stream<GlobalOrInstanceSettingsType?>
      get globalOrInstanceSettingsTypeStream =>
          globalOrInstanceSettingsTypeSubject.stream;

  SwitchEditGlobalOrInstanceSettingsBoolValueFormFieldBloc({
    required this.globalOrInstanceSettingsBloc,
    bool isEnabled = true,
  })  : currentValueSubject =
            BehaviorSubject.seeded(globalOrInstanceSettingsBloc.isGlobal),
        globalOrInstanceSettingsTypeSubject = BehaviorSubject.seeded(
          globalOrInstanceSettingsBloc.isGlobal
              ? GlobalOrInstanceSettingsType.global
              : GlobalOrInstanceSettingsType.instance,
        ),
        super(isEnabled: isEnabled) {
    currentValueSubject.disposeWith(this);
    globalOrInstanceSettingsTypeSubject.disposeWith(this);
  }

  @override
  Future changeCurrentValue(bool? newValue) async {
    var oldValue = currentValue;
    _logger.finest(() => 'changeCurrentValue $newValue oldValue $oldValue');

    if (newValue != oldValue) {
      if (newValue!) {
        globalOrInstanceSettingsTypeSubject.add(null);
        await globalOrInstanceSettingsBloc.cloneGlobalToInstanceSettings();
        await globalOrInstanceSettingsBloc.clearInstanceSettings();
        globalOrInstanceSettingsTypeSubject
            .add(GlobalOrInstanceSettingsType.global);
        currentValueSubject.add(newValue);
      } else {
        globalOrInstanceSettingsTypeSubject.add(null);
        await globalOrInstanceSettingsBloc.cloneGlobalToInstanceSettings();
        globalOrInstanceSettingsTypeSubject
            .add(GlobalOrInstanceSettingsType.instance);
        currentValueSubject.add(newValue);

        // updateInProgress = true;
        // currentValueSubject.add(null);
        // Future.delayed(Duration(milliseconds: 100), () {
        //   globalOrInstanceSettingsBloc.cloneGlobalToInstanceSettings();
        //   currentValueSubject.add(false);
        //   updateInProgress = false;
        // });
      }
    }
  }

  @override
  void clear() {
    changeCurrentValue(true);
  }

  @override
  bool? get currentValue => currentValueSubject.value;

  @override
  Stream<bool?> get currentValueStream => currentValueSubject.stream;

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
      'updateValidators not supported in IsUseGlobalSettingsFormBoolFieldBloc',
    );
  }

  @override
  List<FormValueFieldValidation<bool>> get validators => [];

  @override
  void changeIsEnabled(bool enabled) {
    throw UnsupportedError('changeIsEnabled not supported');
  }

  @override
  bool get isEnabled => true;

  @override
  Stream<bool> get isEnabledStream => Stream.value(isEnabled);

  @override
  bool get isNullValuePossible => true;
}
