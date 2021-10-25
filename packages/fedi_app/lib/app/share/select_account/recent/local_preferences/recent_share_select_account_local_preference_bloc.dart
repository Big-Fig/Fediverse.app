import 'package:fedi_app/app/account/select/recent/local_preferences/recent_select_account_local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRecentShareSelectAccountLocalPreferenceBloc
    implements IRecentSelectAccountLocalPreferenceBloc {
  static IRecentShareSelectAccountLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IRecentShareSelectAccountLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
