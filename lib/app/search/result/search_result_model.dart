import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/widgets.dart';

abstract class ISearchResultItem {
  IStatus get status;

  IAccount get account;

  bool get isStatus => status != null;
  bool get isAccount => account != null;
}

class SearchResultItem extends ISearchResultItem {
  @override
  final IStatus status;
  @override
  final IAccount account;

  SearchResultItem._private({
    @required this.status,
    @required this.account,
  });

  SearchResultItem.status(
    IStatus status,
  ) : this._private(
          status: status,
          account: null,
        );

  SearchResultItem.account(
    IAccount account,
  ) : this._private(
          status: null,
          account: account,
        );
}
