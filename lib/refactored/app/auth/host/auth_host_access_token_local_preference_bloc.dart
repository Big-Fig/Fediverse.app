import 'package:fedi/refactored/local_preferences/local_preference_bloc_impl.dart';
import 'package:fedi/refactored/pleroma/oauth/pleroma_oauth_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAuthHostAccessTokenLocalPreferenceBloc
    implements LocalPreferenceBloc<PleromaOAuthToken> {
  static IAuthHostAccessTokenLocalPreferenceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAuthHostAccessTokenLocalPreferenceBloc>(context,
          listen: listen);
}
