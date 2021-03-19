import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class SearchInputBloc extends DisposableOwner implements ISearchInputBloc {
  @override
  final TextEditingController searchTextEditingController =
      TextEditingController();

  // ignore: close_sinks
  final BehaviorSubject<String> confirmedSearchTermSubject =
      BehaviorSubject.seeded("");

  // ignore: close_sinks
  final BehaviorSubject<String> currentInputSubject =
      BehaviorSubject.seeded("");

  @override
  String? get currentInput => currentInputSubject.value;

  @override
  Stream<String> get currentInputStream => currentInputSubject.stream;

  @override
  bool get currentInputIsNotEmpty => currentInput?.isNotEmpty == true;

  @override
  Stream<bool> get currentInputIsNotEmptyStream =>
      currentInputStream.map((currentInput) => currentInput.isNotEmpty == true);

  @override
  bool get confirmedSearchTermIsNotEmpty =>
      confirmedSearchTerm?.isNotEmpty == true;

  @override
  Stream<bool> get confirmedSearchTermIsNotEmptyStream =>
      confirmedSearchTermStream.map(
        (confirmedSearchTerm) => confirmedSearchTerm.isNotEmpty == true,
      );

  @override
  bool get confirmedSearchTermIsEmpty => !confirmedSearchTermIsNotEmpty;

  @override
  Stream<bool> get confirmedSearchTermIsEmptyStream =>
      confirmedSearchTermIsNotEmptyStream.map(
        (confirmedSearchTermIsNotEmpty) => !confirmedSearchTermIsNotEmpty,
      );

  @override
  void customSearch(String search) {
    searchTextEditingController.text = search;
    confirmedSearchTermSubject.add(search);
  }

  SearchInputBloc() {
    addDisposable(subject: currentInputSubject);
    addDisposable(subject: confirmedSearchTermSubject);
    addDisposable(textEditingController: searchTextEditingController);
    var listener = () {
      currentInputSubject.add(searchTextEditingController.text);
    };
    searchTextEditingController.addListener(listener);
    addDisposable(custom: () {
      searchTextEditingController.removeListener(listener);
    });
  }

  @override
  String? get confirmedSearchTerm => confirmedSearchTermSubject.value;

  @override
  Stream<String> get confirmedSearchTermStream =>
      confirmedSearchTermSubject.stream;

  @override
  void clearSearch() {
    searchTextEditingController.text = "";
    confirmSearch();
  }

  void onSearchTextChanged() {
    var newText = searchTextEditingController.text;
    confirmedSearchTermSubject.add(newText);
  }

  @override
  void confirmSearch() {
    onSearchTextChanged();
  }
}
