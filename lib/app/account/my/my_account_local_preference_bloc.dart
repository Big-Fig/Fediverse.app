import 'package:fedi/app/account/my/my_account_model.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IMyAccountLocalPreferenceBloc
    implements LocalPreferenceBloc<MyAccountRemoteWrapper> {
  static IMyAccountLocalPreferenceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IMyAccountLocalPreferenceBloc>(context, listen: listen);
}
