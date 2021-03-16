import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<PostStatusSettings?> {
  static IPostStatusSettingsBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IPostStatusSettingsBloc>(context,
          listen: listen);

  bool? get markMediaAsNsfwOnAttach;

  Stream<bool?> get markMediaAsNsfwOnAttachStream;

  void changeMarkMediaAsNsfwOnAttach(bool value);

  PleromaVisibility? get defaultVisibility;

  Stream<PleromaVisibility?> get defaultVisibilityStream;

  void changeDefaultVisibility(PleromaVisibility value);

  LocalizationLocale? get defaultStatusLocale;

  Stream<LocalizationLocale?> get defaultStatusLocaleStream;

  void changeDefaultStatusLocale(LocalizationLocale value);
}
