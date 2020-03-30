import 'package:fedi/refactored/app/account/list/account_list_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class ISelectAccountListService extends IAccountListService {

  static ISelectAccountListService of(BuildContext context, {bool listen = true}) =>
      Provider.of<ISelectAccountListService>(context, listen: listen);


  TextEditingController get searchTextEditingController;
  String get searchText;
  Stream<String> get searchTextStream;

  clearSearch();
}
