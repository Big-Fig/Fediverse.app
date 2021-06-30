import 'package:easy_dispose/easy_dispose.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISearchInputBloc extends IDisposable {
  static ISearchInputBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ISearchInputBloc>(context, listen: listen);

  TextEditingController get searchTextEditingController;

  String? get confirmedSearchTerm;

  Stream<String> get confirmedSearchTermStream;

  String? get currentInput;

  Stream<String> get currentInputStream;

  bool get currentInputIsNotEmpty;

  Stream<bool> get currentInputIsNotEmptyStream;

  bool get confirmedSearchTermIsNotEmpty;

  Stream<bool> get confirmedSearchTermIsNotEmptyStream;

  bool get confirmedSearchTermIsEmpty;

  Stream<bool> get confirmedSearchTermIsEmptyStream;

  void clearSearch();

  void confirmSearch();

  void customSearch(String search);
}
