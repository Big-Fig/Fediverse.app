import 'package:fedi/app/account/statuses/account_statuses_tab_model.dart';
import 'package:fedi/app/home/tab/home_tab_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

abstract class IAccountHomeTabBloc extends IHomeTabBloc {
  bool get isEndorsementSupported;

  bool get isFeaturedTagsSupported;

  bool get isSuggestionSupported;

  static IAccountHomeTabBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IAccountHomeTabBloc>(context, listen: listen);

  List<AccountStatusesTab> get tabs;
}
