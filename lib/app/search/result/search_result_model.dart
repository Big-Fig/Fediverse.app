import 'package:fedi/app/account/account_model.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:flutter/widgets.dart';

abstract class ISearchResultItem {
  IStatus get status;

  IAccount get account;

  IHashtag get hashtag;

  bool get isStatus => status != null;

  bool get isAccount => account != null;

  bool get isHashtag => hashtag != null;
}

class SearchResultItem extends ISearchResultItem {
  @override
  final IStatus status;
  @override
  final IAccount account;

  @override
  final IHashtag hashtag;

  SearchResultItem._private({
    @required this.status,
    @required this.account,
    @required this.hashtag,
  });

  SearchResultItem.hashtag(
    IHashtag hashtag,
  ) : this._private(
          hashtag: hashtag,
          status: null,
          account: null,
        );

  SearchResultItem.status(
    IStatus status,
  ) : this._private(
          status: status,
          account: null,
          hashtag: null,
        );

  SearchResultItem.account(
    IAccount account,
  ) : this._private(
          hashtag: null,
          status: null,
          account: account,
        );
}
