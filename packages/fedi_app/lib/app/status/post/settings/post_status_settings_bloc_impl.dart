import 'package:fedi_app/app/settings/global_or_instance/local_preferences/global_or_instance_settings_bloc_local_preference_impl.dart';
import 'package:fedi_app/app/status/post/settings/local_preferences/post_status_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi_app/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:unifedi_api/unifedi_api.dart';

class PostStatusSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferenceBloc<PostStatusSettings>
    implements IPostStatusSettingsBloc {
  PostStatusSettingsBloc({
    required IPostStatusSettingsLocalPreferenceBloc<PostStatusSettings>
        globalLocalPreferencesBloc,
    required IPostStatusSettingsLocalPreferenceBloc<PostStatusSettings?>
        instanceLocalPreferencesBloc,
  }) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  bool get markMediaAsNsfwOnAttach => settingsData.markMediaAsNsfwOnAttach;

  @override
  Stream<bool> get markMediaAsNsfwOnAttachStream =>
      settingsDataStream.map((settings) => settings.markMediaAsNsfwOnAttach);

  @override
  Future<void> changeMarkMediaAsNsfwOnAttach(bool value) =>
      updateInstanceSettings(
        settingsData.copyWith(
          markMediaAsNsfwOnAttach: value,
        ),
      );

  @override
  bool get dontUploadMediaDuringEditing =>
      settingsData.dontUploadMediaDuringEditing;

  @override
  Stream<bool> get dontUploadMediaDuringEditingStream => settingsDataStream
      .map((settings) => settings.dontUploadMediaDuringEditing);

  @override
  Future<void> changeDontUploadMediaDuringEditing(bool value) =>
      updateInstanceSettings(
        settingsData.copyWith(
          dontUploadMediaDuringEditing: value,
        ),
      );

  @override
  UnifediApiVisibility get defaultVisibilityAsUnifediApi =>
      settingsData.defaultVisibilityAsUnifediApi;

  @override
  Stream<UnifediApiVisibility> get defaultVisibilityAsUnifediApiStream =>
      settingsDataStream
          .map((settings) => settings.defaultVisibilityAsUnifediApi);

  @override
  Future<void> changeDefaultVisibilityAsUnifediApi(
    UnifediApiVisibility value,
  ) =>
      updateInstanceSettings(
        settingsData.copyWith(
          defaultVisibilityString: value.stringValue,
        ),
      );

  @override
  LocalizationLocale? get defaultStatusLocale =>
      settingsData.defaultStatusLocale;

  @override
  Stream<LocalizationLocale?> get defaultStatusLocaleStream =>
      settingsDataStream.map((settings) => settings.defaultStatusLocale);

  @override
  Future<void> changeDefaultStatusLocale(LocalizationLocale? value) =>
      updateInstanceSettings(
        PostStatusSettings(
          dontUploadMediaDuringEditing: dontUploadMediaDuringEditing,
          markMediaAsNsfwOnAttach: markMediaAsNsfwOnAttach,
          defaultStatusLocale: value,
          defaultVisibilityString: defaultVisibilityAsUnifediApi.stringValue,
        ),
        // copy with dont support null
        // settingsData?.copyWith(
        //   defaultStatusLocale: value,
        // ),
      );
}
