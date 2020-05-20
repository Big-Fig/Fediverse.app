import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:fedi/disposable/disposable.dart';
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

    var listener = () {
      onSearchTextChanged();
    };
    searchTextEditingController.addListener(listener);
    addDisposable(disposable: CustomDisposable(() {
      searchTextEditingController.removeListener(listener);
    }));
  }

  @override
  String get searchText => searchTextSubject.value;

  @override
  Stream<String> get searchTextStream => searchTextSubject.stream;

  @override
  void clearSearch() {
    searchTextEditingController.text = "";
  }

  void onSearchTextChanged() {
    var oldText = searchTextSubject.value ?? "";
    var newText = searchTextEditingController.text ?? "";
    if (newText != oldText) {
      searchTextSubject.add(newText);
    }
  }
}
