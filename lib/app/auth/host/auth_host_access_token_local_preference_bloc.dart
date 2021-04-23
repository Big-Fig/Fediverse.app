import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/pleroma/api/oauth/pleroma_api_oauth_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAuthHostAccessTokenLocalPreferenceBloc
    implements LocalPreferenceBloc<PleromaOAuthToken?> {
  static IAuthHostAccessTokenLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAuthHostAccessTokenLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
