import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/account/list/cached/account_cached_list_bloc.dart';
import 'package:fedi_app/app/account/select/suggestion/suggestion_select_account_bloc.dart';

class SuggestionSelectAccountBloc extends DisposableOwner
    implements ISuggestionSelectAccountBloc {
  @override
  final IAccountCachedListBloc accountCachedListBloc;

  SuggestionSelectAccountBloc({required this.accountCachedListBloc});
}
