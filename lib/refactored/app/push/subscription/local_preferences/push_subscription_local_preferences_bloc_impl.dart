import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_bloc.dart';
import 'package:fedi/refactored/app/push/subscription/local_preferences/push_subscription_local_preferences_model.dart';
import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/local_preferences/local_preferences_service.dart';

class PushSubscriptionLocalPreferencesBloc
    extends ObjectLocalPreferenceBloc<PushSubscriptionLocalPreferences>
    implements IPushSubscriptionLocalPreferencesBloc {
  PushSubscriptionLocalPreferencesBloc(
      ILocalPreferencesService preferencesService, String userAtHost)
      : super(preferencesService, "$userAtHost.push.subscription", 1);

  @override
  PushSubscriptionLocalPreferences get defaultValue =>
      PushSubscriptionLocalPreferences.defaultAllEnabled();
}
