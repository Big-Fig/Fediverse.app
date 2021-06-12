import 'package:fedi/local_preferences/local_preference_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAskInAppReviewLocalPreferenceBloc
    implements ILocalPreferenceBloc<bool> {
  static IAskInAppReviewLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAskInAppReviewLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
