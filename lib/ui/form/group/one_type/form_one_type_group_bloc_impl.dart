import 'package:fedi/ui/form/group/form_group_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

typedef NewFieldCreator<T> = T Function();

class FormOneTypeGroupBloc<T extends IFormItemBloc> extends FormGroupBloc<T>
    implements IFormOneTypeGroupBloc<T> {
  @override
  final int maximumFieldsCount;
  final NewFieldCreator<T> newFieldCreator;

  final List<T> originalItems;

  bool isGroupChanged = false;

  FormOneTypeGroupBloc({
    @required this.maximumFieldsCount,
    @required this.newFieldCreator,
    @required this.originalItems,
  }) : _itemsSubject = BehaviorSubject.seeded(originalItems) {
    addDisposable(subject: _itemsSubject);
    addDisposable(subject: _isChangedSubject);
    originalItems.forEach((field) {
      addDisposable(
          streamSubscription: field.isSomethingChangedStream.listen((_) {
        checkIsSomethingChanged();
      }));
    });
  }

  final BehaviorSubject<bool> _isChangedSubject = BehaviorSubject.seeded(false);
  final BehaviorSubject<List<T>> _itemsSubject;

  @override
  bool get isMaximumFieldsCountReached => items.length >= maximumFieldsCount;

  @override
  Stream<bool> get isMaximumFieldsCountReachedStream => itemsStream
      .map((customFields) => items.length >= maximumFieldsCount);

  @override
  List<T> get items => _itemsSubject.value;

  @override
  Stream<List<T>> get itemsStream => _itemsSubject.stream;

  @override
  bool get isSomethingChanged => _isChangedSubject.value;

  @override
  Stream<bool> get isSomethingChangedStream =>_isChangedSubject.stream;

  bool checkIsSomethingChanged() {
    var isChanged = isGroupChanged ||
        items.map((field) => field.isSomethingChanged).fold(false,
            (previousValue, element) {
          return previousValue | element;
        });
    _isChangedSubject.add(isChanged);
    return isChanged;
  }

  @override
  void addNewEmptyField() {
    assert(!isMaximumFieldsCountReached);

    var newField = newFieldCreator();
    items.add(newField);
    _itemsSubject.add(items);
    isGroupChanged = true;
    checkIsSomethingChanged();
  }

  @override
  void removeField(T field) {
    items.remove(field);
    _itemsSubject.add(items);
    isGroupChanged = true;
    checkIsSomethingChanged();

    Future.delayed(Duration(seconds: 1), () {
      field.dispose();
    });
  }

}
