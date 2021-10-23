import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class IPostStatusSettingsBloc
    implements IGlobalOrInstanceSettingsBloc<PostStatusSettings> {
  static IPostStatusSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPostStatusSettingsBloc>(context, listen: listen);

  bool get markMediaAsNsfwOnAttach;

  Stream<bool> get markMediaAsNsfwOnAttachStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeMarkMediaAsNsfwOnAttach(bool value);

  bool get dontUploadMediaDuringEditing;

  Stream<bool> get dontUploadMediaDuringEditingStream;

  // ignore: avoid_positional_boolean_parameters
  Future<void> changeDontUploadMediaDuringEditing(bool value);

  UnifediApiVisibility get defaultVisibilityAsUnifediApi;

  Stream<UnifediApiVisibility> get defaultVisibilityAsUnifediApiStream;

  Future<void> changeDefaultVisibilityAsUnifediApi(UnifediApiVisibility value);

  LocalizationLocale? get defaultStatusLocale;

  Stream<LocalizationLocale?> get defaultStatusLocaleStream;

  Future<void> changeDefaultStatusLocale(LocalizationLocale? value);
}
