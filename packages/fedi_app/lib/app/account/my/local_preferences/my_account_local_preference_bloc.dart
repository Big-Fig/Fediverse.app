import 'package:fedi_app/app/account/my/my_account_model.dart';
import 'package:fedi_app/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountLocalPreferenceBloc
    implements LocalPreferenceBloc<UnifediApiMyAccountWrapper?> {
  static IMyAccountLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IMyAccountLocalPreferenceBloc>(context, listen: listen);
}
