import 'package:fedi/app/ui/theme/current/chooser/current_fedi_ui_theme_chooser_bloc.dart';
import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/ui/form/field/value/form_value_field_validation.dart';
import 'package:fedi/ui/form/form_item_validation.dart';
import 'package:flutter/widgets.dart';

class CurrentFediUiThemeChooserBloc extends DisposableOwner
    implements ICurrentFediUiThemeChooserBloc {
  final ICurrentFediUiThemeBloc currentFediUiThemeBloc;
  final IFediUiTheme lightTheme;
  final IFediUiTheme darkTheme;

  CurrentFediUiThemeChooserBloc({
    @required this.currentFediUiThemeBloc,
    @required this.lightTheme,
    @required this.darkTheme,
  });

  @override
  void changeCurrentValue(IFediUiTheme newValue) {
    currentFediUiThemeBloc.changeTheme(newValue);
  }

  @override
  void clear() {
    currentFediUiThemeBloc.changeTheme(null);
  }

  @override
  bool get currentValue => currentFediUiThemeBloc.currentTheme == darkTheme;

  @override
  Stream<bool> get currentValueStream =>
      currentFediUiThemeBloc.currentThemeStream
          .map((currentTheme) => currentTheme == darkTheme);

  @override
  List<FormItemValidationError> get errors => [];

  @override
  Stream<List<FormItemValidationError>> get errorsStream =>
      Stream.value(errors);

  @override
  bool get isHaveAtLeastOneError => errors?.isNotEmpty == true;

  @override
  Stream<bool> get isHaveAtLeastOneErrorStream =>
      errorsStream.map((errors) => errors?.isNotEmpty == true);

  @override
  bool get isSomethingChanged => false;

  @override
  Stream<bool> get isSomethingChangedStream => Stream.value(isSomethingChanged);

  @override
  bool get originValue => false;

  @override
  void updateValidators(List<FormValueFieldValidation<bool>> validators) {}

  @override
  List<FormValueFieldValidation<bool>> get validators => [];
}
