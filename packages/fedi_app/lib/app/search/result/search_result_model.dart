import 'package:fedi_app/app/account/account_model.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/status/status_model.dart';

enum SearchResultItemType {
  status,
  account,
  hashtag,
}

abstract class ISearchResultItem {
  IStatus? get status;

  IAccount? get account;

  IHashtag? get hashtag;

  SearchResultItemType get type;
}

class SearchResultItem extends ISearchResultItem {
  @override
  final IStatus? status;
  @override
  final IAccount? account;

  @override
  final IHashtag? hashtag;

  @override
  final SearchResultItemType type;

  SearchResultItem._private({
    required this.status,
    required this.account,
    required this.hashtag,
    required this.type,
  });

  SearchResultItem.hashtag(
    IHashtag hashtag,
  ) : this._private(
          hashtag: hashtag,
          status: null,
          account: null,
          type: SearchResultItemType.hashtag,
        );

  SearchResultItem.status(
    IStatus? status,
  ) : this._private(
          status: status,
          account: null,
          hashtag: null,
          type: SearchResultItemType.status,
        );

  SearchResultItem.account(
    IAccount account,
  ) : this._private(
          hashtag: null,
          status: null,
          account: account,
          type: SearchResultItemType.account,
        );
}
