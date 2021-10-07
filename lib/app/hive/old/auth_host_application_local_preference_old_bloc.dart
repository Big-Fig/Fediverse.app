import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:pleroma_api/pleroma_api.dart';
import 'package:provider/provider.dart';

abstract class IAuthHostApplicationLocalPreferenceBlocOld
    implements LocalPreferenceBloc<PleromaApiClientApplication?> {
  static IAuthHostApplicationLocalPreferenceBlocOld of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAuthHostApplicationLocalPreferenceBlocOld>(
        context,
        listen: listen,
      );
}
