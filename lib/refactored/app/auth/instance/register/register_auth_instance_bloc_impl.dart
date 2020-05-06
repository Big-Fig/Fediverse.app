import 'dart:async';

import 'package:fedi/refactored/app/auth/instance/register/register_auth_instance_bloc.dart';
import 'package:fedi/refactored/app/form/form_field_error_model.dart';
import 'package:fedi/refactored/app/form/form_model.dart';
import 'package:fedi/refactored/disposable/disposable_owner.dart';
import 'package:rxdart/rxdart.dart';

class JoinAuthInstanceRegisterBloc extends DisposableOwner
    implements IRegisterAuthInstanceBloc {
  @override
  final FormTextField usernameField = FormTextField(initialValue: "",
      validators: [EmptyFormTextFieldError.createValidator()]);

  @override
  final FormTextField emailField = FormTextField(initialValue: "",
      validators: [InvalidEmailFormTextFieldError.createValidator()]);

  @override
  final FormTextField passwordField = FormTextField(initialValue: "",
      validators: [
        InvalidLengthFormTextFieldError.createValidator(
            minLength: 4, maxLength: null)
      ]);

  @override
  FormTextField confirmPasswordField;

  List<FormTextField> get fields =>
      [usernameField, emailField, passwordField, confirmPasswordField,
      ];
  List<Stream<bool>> get fieldHasErrorStreams =>
      fields.map((field) => field.hasErrorStream).toList();

  @override
  Stream<bool> get readyToSubmitStream =>
      Rx.combineLatest(fieldHasErrorStreams, (fieldHasErrors) =>
          fieldHasErrors.fold(true, (previous, hasError) => previous &
          !hasError)
      );

  @override
  bool get readyToSubmit =>
      fields.fold(true, (previous, formField) => previous & !formField
          .hasError);

  JoinAuthInstanceRegisterBloc() {
    confirmPasswordField =
        FormPasswordMatchTextField(passwordField: passwordField);

    addDisposable(disposable: usernameField);
    addDisposable(disposable: emailField);
    addDisposable(disposable: passwordField);
    addDisposable(disposable: confirmPasswordField);
  }
}
