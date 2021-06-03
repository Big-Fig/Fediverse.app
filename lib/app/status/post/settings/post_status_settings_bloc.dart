import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:fedi/pleroma/api/visibility/pleroma_api_visibility_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<PostStatusSettings> {
  static IPostStatusSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPostStatusSettingsBloc>(context, listen: listen);

  bool get markMediaAsNsfwOnAttach;

  Stream<bool> get markMediaAsNsfwOnAttachStream;

  Future changeMarkMediaAsNsfwOnAttach(bool value);

  PleromaApiVisibility get defaultVisibilityAsPleromaApi;

  Stream<PleromaApiVisibility> get defaultVisibilityAsPleromaApiStream;

  Future changeDefaultVisibilityAsPleromaApi(PleromaApiVisibility value);

  LocalizationLocale? get defaultStatusLocale;

  Stream<LocalizationLocale?> get defaultStatusLocaleStream;

  Future changeDefaultStatusLocale(LocalizationLocale? value);
}
