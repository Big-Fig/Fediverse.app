import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/form_group_bloc_impl.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

typedef NewEmptyFieldCreator<T> = T Function();

class FormOneTypeGroupBloc<T extends IFormItemBloc> extends FormGroupBloc<T>
    implements IFormOneTypeGroupBloc<T> {
  @override
  final int maximumFieldsCount;
  @override
  final int minimumFieldsCount;
  final NewEmptyFieldCreator<T> newEmptyFieldCreator;

  final List<T> originalItems;

  bool isGroupChanged = false;

  FormOneTypeGroupBloc({
    @required this.maximumFieldsCount,
    @required this.minimumFieldsCount,
    @required this.newEmptyFieldCreator,
    @required this.originalItems,
  }) : _itemsSubject = BehaviorSubject.seeded([
          ...originalItems,
        ]) {
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
  bool get isMaximumFieldsCountReached =>
      maximumFieldsCount != null ? items.length >= maximumFieldsCount : false;

  @override
  bool get isMinimumFieldsCountReached =>
      minimumFieldsCount != null ? items.length <= minimumFieldsCount : false;

  @override
  Stream<bool> get isMaximumFieldsCountReachedStream =>
      itemsStream.map((customFields) => maximumFieldsCount != null
          ? items.length >= maximumFieldsCount
          : false);

  @override
  Stream<bool> get isMinimumFieldsCountReachedStream =>
      itemsStream.map((customFields) => minimumFieldsCount != null
          ? items.length <= minimumFieldsCount
          : false);

  @override
  Stream<bool> get isPossibleToRemoveFieldsStream =>
      isMinimumFieldsCountReachedStream
          .map((isMinimumFieldsCountReached) => !isMinimumFieldsCountReached);

  @override
  bool get isPossibleToRemoveFields => !isMinimumFieldsCountReached;

  @override
  Stream<bool> get isPossibleToAddFieldsStream =>
      isMaximumFieldsCountReachedStream
          .map((isMaximumFieldsCountReached) => !isMaximumFieldsCountReached);

  @override
  bool get isPossibleToAddFields => !isMaximumFieldsCountReached;

  @override
  List<T> get items => _itemsSubject.value;

  @override
  Stream<List<T>> get itemsStream => _itemsSubject.stream;

  @override
  bool get isSomethingChanged => _isChangedSubject.value;

  @override
  Stream<bool> get isSomethingChangedStream => _isChangedSubject.stream;

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
  T addNewEmptyField() {
    assert(!isMaximumFieldsCountReached);

    var newField = newEmptyFieldCreator();
    items.add(newField);
    _itemsSubject.add(items);
    isGroupChanged = true;
    checkIsSomethingChanged();
    recalculateErrors();

    return newField;
  }

  @override
  void removeField(T field) {
    items.remove(field);
    _itemsSubject.add(items);
    isGroupChanged = true;
    checkIsSomethingChanged();
    recalculateErrors();
    Future.delayed(Duration(seconds: 1), () {
      field.dispose();
    });
  }

  @override
  void clear() {
    for (var item in items) {
      item.clear();
    }
    _itemsSubject.add(originalItems);
  }

  @override
  T addNewField(T newField) {
    assert(!isMaximumFieldsCountReached);

    items.add(newField);
    _itemsSubject.add(items);
    isGroupChanged = true;
    checkIsSomethingChanged();
    recalculateErrors();

    return newField;
  }

  @override
  void removeAllFields() {
    items.clear();
    _itemsSubject.add(items);
  }

  @override
  bool isLast(T item) {
    if (items.isNotEmpty == true) {
      return items.last == item;
    } else {
      return false;
    }
  }

  @override
  T findNextItemFor(T item) {
    var index = items.indexOf(item);

    if (index >= 0 && index + 1 < items.length) {
      return items[index + 1];
    } else {
      return null;
    }
  }

  @override
  int indexOf(T item) => items.indexOf(item);
}
