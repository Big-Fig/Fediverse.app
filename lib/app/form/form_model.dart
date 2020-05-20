import 'package:fedi/app/form/form_field_error_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

typedef FormFieldError FormFieldErrorValidator(String currentValue);

class FormTextField extends DisposableOwner {
  final TextEditingController textEditingController;

  // ignore: close_sinks
  final BehaviorSubject<String> _valueSubject;

  // ignore: close_sinks
  final BehaviorSubject<FormFieldError> _errorSubject;

  final List<FormFieldErrorValidator> validators;

  Stream<String> get valueStream => _valueSubject.stream;
  String get value => _valueSubject.value;
  Stream<FormFieldError> get errorStream => _errorSubject.stream;
  FormFieldError get error => _errorSubject.value;
  FormTextField({@required this.validators, @required String initialValue})
      : _valueSubject = BehaviorSubject.seeded(initialValue),
        _errorSubject = BehaviorSubject(),
        textEditingController = TextEditingController(text: initialValue) {
    addDisposable(subject: _valueSubject);
    addDisposable(subject: _errorSubject);
    addDisposable(textEditingController: textEditingController);

    var listener = () {
      _valueSubject.add(textEditingController.text);
    };
    textEditingController.addListener(listener);

    addDisposable(disposable: CustomDisposable(() {
      textEditingController.removeListener(listener);
    }));

    addDisposable(streamSubscription: _valueSubject.stream.listen((value) {
      return checkErrors(value);
    }));
  }

  bool get hasError => error != null;
  Stream<bool> get hasErrorStream => errorStream.map((error) => error != null);

  void checkErrors(String value) {
    var error = findError(value);

    _errorSubject.add(error);
  }

  FormFieldError findError(String value) {
    var error;
    for (var validator in validators ?? []) {
      error = validator(value);
      if (error != null) {
        break;
      }
    }
    return error;
  }
}

class FormPasswordMatchTextField extends FormTextField {
  final FormTextField passwordField;

  FormPasswordMatchTextField({@required this.passwordField})
      : super(validators: [
          (currentValue) {
            if (currentValue == passwordField.value) {
              return null;
            } else {
              return PasswordNotMatchFormTextFieldError();
            }
          }
        ], initialValue: "") {
    addDisposable(streamSubscription: passwordField.valueStream.listen((_) {
      checkErrors(value);
    }));
  }
}
