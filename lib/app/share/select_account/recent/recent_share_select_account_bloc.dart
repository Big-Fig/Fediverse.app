import 'package:fedi/app/account/select/recent/recent_select_account_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRecentShareSelectAccountBloc
    implements IRecentSelectAccountBloc {
  static IRecentShareSelectAccountBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRecentShareSelectAccountBloc>(
        context,
        listen: listen,
      );
}
