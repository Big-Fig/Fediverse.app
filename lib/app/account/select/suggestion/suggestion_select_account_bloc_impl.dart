import 'package:fedi/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi/app/account/select/suggestion/suggestion_select_account_bloc.dart';
import 'package:fedi/disposable/disposable_owner.dart';

class SuggestionSelectAccountBloc extends DisposableOwner
    implements ISuggestionSelectAccountBloc {
  @override
  final IAccountCachedListBloc accountCachedListBloc;

  SuggestionSelectAccountBloc({required this.accountCachedListBloc});
}
