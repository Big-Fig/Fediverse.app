import 'package:fedi/in_app_review/ask/local_preferences/ask_in_app_review_local_preference_bloc.dart';
import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/local_preferences/local_preferences_service.dart';

class AskInAppReviewLocalPreferenceBloc extends BoolLocalPreferenceBloc
    implements IAskInAppReviewLocalPreferenceBloc {
  AskInAppReviewLocalPreferenceBloc(
    ILocalPreferencesService preferencesService,
  ) : super(
          preferencesService: preferencesService,
          key: 'in_app_review.asked',
        );

  static const defaultValue = false;

  @override
  bool get defaultPreferenceValue => defaultValue;
}
