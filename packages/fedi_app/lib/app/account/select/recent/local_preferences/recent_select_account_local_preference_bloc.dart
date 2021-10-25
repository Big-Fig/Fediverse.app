import 'package:fedi_app/app/account/select/recent/recent_select_account_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRecentSelectAccountLocalPreferenceBloc
    implements LocalPreferenceBloc<RecentSelectAccountList?> {
  static IRecentSelectAccountLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRecentSelectAccountLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
