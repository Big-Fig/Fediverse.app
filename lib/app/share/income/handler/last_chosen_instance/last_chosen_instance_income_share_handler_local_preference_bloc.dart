import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc
    implements ObjectLocalPreferenceBloc<UnifediApiAccess?> {
  static ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<
          ILastChosenInstanceIncomeIncomeShareHandlerLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
