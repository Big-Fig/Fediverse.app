import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:fedi/app/search/input/search_input_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class SearchInputBloc extends DisposableOwner implements ISearchInputBloc {
  @override
  final TextEditingController searchTextEditingController;

  // ignore: close_sinks
  final BehaviorSubject<String> confirmedSearchTermSubject =
      BehaviorSubject.seeded('');

  // ignore: close_sinks
  final BehaviorSubject<String> currentInputSubject =
      BehaviorSubject.seeded('');

  @override
  String? get currentInput => currentInputSubject.valueOrNull;

  @override
  Stream<String> get currentInputStream => currentInputSubject.stream;

  @override
  bool get currentInputIsNotEmpty => currentInput?.isNotEmpty == true;

  @override
  Stream<bool> get currentInputIsNotEmptyStream =>
      currentInputStream.map((currentInput) => currentInput.isNotEmpty);

  @override
  bool get confirmedSearchTermIsNotEmpty =>
      confirmedSearchTerm?.isNotEmpty == true;

  @override
  Stream<bool> get confirmedSearchTermIsNotEmptyStream =>
      confirmedSearchTermStream.map(
        (confirmedSearchTerm) => confirmedSearchTerm.isNotEmpty,
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

  SearchInputBloc({
    required String? initialQuery,
  }) : searchTextEditingController = TextEditingController(
          text: initialQuery,
        ) {
    currentInputSubject.disposeWith(this);
    confirmedSearchTermSubject.disposeWith(this);
    searchTextEditingController.disposeWith(this);

    var listener = () {
      currentInputSubject.add(searchTextEditingController.text);
    };
    searchTextEditingController.addListener(listener);
    addCustomDisposable(() {
      searchTextEditingController.removeListener(listener);
    });

    if (initialQuery?.isNotEmpty == true) {
      confirmSearch();
    }
  }

  @override
  String? get confirmedSearchTerm => confirmedSearchTermSubject.valueOrNull;

  @override
  Stream<String> get confirmedSearchTermStream =>
      confirmedSearchTermSubject.stream;

  @override
  void clearSearch() {
    searchTextEditingController.text = '';
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
