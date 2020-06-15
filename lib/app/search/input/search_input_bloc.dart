import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ISearchInputBloc extends Disposable {
  static ISearchInputBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<ISearchInputBloc>(context, listen: listen);

  TextEditingController get searchTextEditingController;

  String get searchText;

  Stream<String> get searchTextStream;

  void clearSearch();

  void performSearch();
}
