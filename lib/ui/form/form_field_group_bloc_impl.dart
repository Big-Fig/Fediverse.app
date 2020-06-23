import 'package:fedi/ui/form/form_field_bloc.dart';
import 'package:fedi/ui/form/form_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_field_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

typedef NewFieldCreator<T> = T Function();

class FormFieldGroupBloc<T extends IFormFieldBloc> extends FormFieldBloc
    implements IFormFieldGroupBloc<T> {
  @override
  final int maximumFieldsCount;
  final NewFieldCreator<T> newFieldCreator;

  final List<T> originalFields;

  bool isGroupChanged = false;

  FormFieldGroupBloc({
    @required this.maximumFieldsCount,
    @required this.newFieldCreator,
    @required this.originalFields,
  }) : _fieldsSubject = BehaviorSubject.seeded(originalFields) {
    addDisposable(subject: _fieldsSubject);
    originalFields.forEach((field) {
      addDisposable(streamSubscription: field.isChangedStream.listen((_) {
        checkIsSomethingChanged();
      }));
    });
  }

  final BehaviorSubject<List<T>> _fieldsSubject;

  @override
  bool get isMaximumCustomFieldsCountReached =>
      fields.length >= maximumFieldsCount;

  @override
  Stream<bool> get isMaximumCustomFieldsCountReachedStream => fieldsStream
      .map((customFields) => customFields.length >= maximumFieldsCount);

  @override
  List<T> get fields => _fieldsSubject.value;

  @override
  Stream<List<T>> get fieldsStream => _fieldsSubject.stream;

  bool checkIsSomethingChanged() {
    var isChanged = isGroupChanged ||
        fields.map((field) => field.isChanged).fold(false,
                (previousValue, element) {
              return previousValue | element;
            });
    isChangedSubject.add(isChanged);
    return isChanged;
  }

  @override
  void addNewEmptyCustomField() {
    assert(!isMaximumCustomFieldsCountReached);

    var newField = newFieldCreator();
    fields.add(newField);
    _fieldsSubject.add(fields);
    isGroupChanged = true;
    checkIsSomethingChanged();
  }

  @override
  void removeCustomField(T field) {
    fields.remove(field);
    _fieldsSubject.add(fields);
    isGroupChanged = true;
    checkIsSomethingChanged();

    Future.delayed(Duration(seconds: 1), () {
      field.dispose();
    });
  }
}
