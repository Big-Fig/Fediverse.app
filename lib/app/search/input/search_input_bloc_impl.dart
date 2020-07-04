import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class SearchInputBloc extends DisposableOwner implements ISearchInputBloc {
  @override
  final TextEditingController searchTextEditingController =
      TextEditingController();

  // ignore: close_sinks
  final BehaviorSubject<String> searchTextSubject = BehaviorSubject.seeded("");

  SearchInputBloc() {
    addDisposable(subject: searchTextSubject);
    addDisposable(textEditingController: searchTextEditingController);
  }

  @override
  String get confirmedSearchTerm => searchTextSubject.value;

  @override
  Stream<String> get confirmedSearchTermStream => searchTextSubject.stream;

  @override
  void clearSearch() {
    searchTextEditingController.text = "";
  }

  void onSearchTextChanged() {
    var newText = searchTextEditingController.text ?? "";
    searchTextSubject.add(newText);
  }

  @override
  void confirmSearch() {
    onSearchTextChanged();
  }
}
