import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class IEditMyAccountField {
  bool get isChanged;

  Stream<bool> get isChangedStream;
}

abstract class EditMyAccountField extends DisposableOwner
    implements IEditMyAccountField {
  @override
  bool get isChanged => isChangedSubject.value;

  @override
  Stream<bool> get isChangedStream => isChangedSubject.stream;
  @protected
  // ignore: close_sinks
  BehaviorSubject<bool> isChangedSubject = BehaviorSubject.seeded(false);
  EditMyAccountField() {
    addDisposable(subject: isChangedSubject);
  }
}

class EditMyAccountStringField extends EditMyAccountField {
  final String originValue;
  String get currentValue => textEditingController.text;
  final TextEditingController textEditingController;

  EditMyAccountStringField({@required this.originValue})
      : textEditingController = TextEditingController(text: originValue ?? "") {
    var listener = () {
      var currentValue = textEditingController.text;

      bool isChanged = (currentValue ?? "") != (originValue ?? "");
      isChangedSubject.add(isChanged);
    };
    addDisposable(textEditingController: textEditingController);
    textEditingController.addListener(listener);
    addDisposable(disposable: CustomDisposable(() {
      textEditingController.removeListener(listener);
    }));
  }
}

class EditMyAccountBoolField extends EditMyAccountField {
  final bool originValue;
  final BehaviorSubject<bool> currentValueSubject;
  bool get currentValue => currentValueSubject.value;
  Stream<bool> get currentValueStream => currentValueSubject.stream;

  EditMyAccountBoolField({@required this.originValue})
      : currentValueSubject = BehaviorSubject.seeded(originValue) {
    addDisposable(subject: currentValueSubject);
    addDisposable(streamSubscription: currentValueSubject.listen((newValue) {
      var isChanged = newValue != originValue;
      isChangedSubject.add(isChanged);
    }));
  }

  void onValueChanged(bool newValue) {
    currentValueSubject.add(newValue);
  }
}

class EditMyAccountCustomField extends DisposableOwner
    implements IEditMyAccountField {
  final int index;
  final EditMyAccountStringField nameField;
  final EditMyAccountStringField valueField;

  EditMyAccountCustomField(
      {@required this.index,
      @required this.nameField,
      @required this.valueField}) {
    addDisposable(disposable: nameField);
    addDisposable(disposable: valueField);
  }

  @override
  String toString() {
    return 'EditMyAccountCustomField{position: $index,'
        ' nameField: $nameField, valueField: $valueField}';
  }

  @override
  bool get isChanged => nameField.isChanged || valueField.isChanged;

  @override
  Stream<bool> get isChangedStream => Rx.combineLatest2(
      nameField.isChangedStream,
      valueField.isChangedStream,
      (nameIsChanged, valueIsChanged) => nameIsChanged || valueIsChanged);
}
