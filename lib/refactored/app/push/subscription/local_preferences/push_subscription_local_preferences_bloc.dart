import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPushSubscriptionLocalPreferencesBloc
    implements LocalPreferenceBloc<PushSubscriptionLocalPreferences> {
  static IPushSubscriptionLocalPreferencesBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPushSubscriptionLocalPreferencesBloc>(context,
          listen: listen);
}
