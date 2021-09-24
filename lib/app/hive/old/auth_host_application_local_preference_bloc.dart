import 'package:fedi/local_preferences/local_preference_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pleroma_api/pleroma_api.dart';

abstract class IAuthHostApplicationLocalPreferenceBloc
    implements LocalPreferenceBloc<PleromaApiClientApplication?> {
  static IAuthHostApplicationLocalPreferenceBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAuthHostApplicationLocalPreferenceBloc>(
        context,
        listen: listen,
      );
}
