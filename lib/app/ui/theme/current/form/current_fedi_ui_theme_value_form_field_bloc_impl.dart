import 'package:fedi/app/ui/theme/current/current_fedi_ui_theme_bloc.dart';
import 'package:fedi/app/ui/theme/current/form/current_fedi_ui_theme_value_form_field_bloc.dart';
import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/form/field/value/value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/widgets.dart';

class CurrentFediUiThemeValueFormFieldBloc extends ValueFormFieldBloc<IFediUiTheme>
    implements ICurrentFediUiThemeValueFormFieldBloc {
  final ICurrentFediUiThemeBloc currentFediUiThemeBloc;
  final IFediUiTheme lightTheme;
  final IFediUiTheme darkTheme;

  CurrentFediUiThemeValueFormFieldBloc({
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
  IFediUiTheme get currentValue => currentFediUiThemeBloc.currentTheme;

  @override
  Stream<IFediUiTheme> get currentValueStream =>
      currentFediUiThemeBloc.currentThemeStream;

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
  IFediUiTheme get originValue => null;

  @override
  void updateValidators(
      List<FormValueFieldValidation<IFediUiTheme>> validators) {}

  @override
  List<FormValueFieldValidation<IFediUiTheme>> get validators => [];
}
