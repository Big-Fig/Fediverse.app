import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:pleroma_api/pleroma_api.dart';
import 'package:provider/provider.dart';

abstract class IAuthHostAccessTokenLocalPreferenceBlocOld
    implements LocalPreferenceBloc<PleromaApiOAuthToken?> {
  static IAuthHostAccessTokenLocalPreferenceBlocOld of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAuthHostAccessTokenLocalPreferenceBlocOld>(
        context,
        listen: listen,
      );
}
