import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
    implements ObjectLocalPreferenceBloc<AuthInstance?> {
  static ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
