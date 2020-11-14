import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_bloc_local_preferences_impl.dart';
import 'package:fedi/app/status/post/settings/local_preferences/post_status_settings_local_preferences_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_model.dart';
import 'package:fedi/pleroma/visibility/pleroma_visibility_model.dart';

class PostStatusSettingsBloc
    extends GlobalOrInstanceSettingsLocalPreferencesBloc<PostStatusSettings>
    implements IPostStatusSettingsBloc {
  PostStatusSettingsBloc(
    IPostStatusSettingsLocalPreferencesBloc globalLocalPreferencesBloc,
    IPostStatusSettingsLocalPreferencesBloc instanceLocalPreferencesBloc,
  ) : super(
          globalLocalPreferencesBloc: globalLocalPreferencesBloc,
          instanceLocalPreferencesBloc: instanceLocalPreferencesBloc,
        );

  @override
  PleromaVisibility get defaultVisibility =>
      settingsData.defaultVisibilityPleroma;

  @override
  Stream<PleromaVisibility> get defaultVisibilityStream =>
      settingsDataStream.map((settings) => settings.defaultVisibilityPleroma);

  @override
  bool get markMediaAsNsfwOnAttach => settingsData.markMediaAsNsfwOnAttach;

  @override
  Stream<bool> get markMediaAsNsfwOnAttachStream =>
      settingsDataStream.map((settings) => settings.markMediaAsNsfwOnAttach);

  @override
  void changeDefaultVisibility(PleromaVisibility value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          defaultVisibilityString: value.toJsonValue(),
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          defaultVisibilityString: value.toJsonValue(),
        ),
      );
    }
  }

  @override
  void changeMarkMediaAsNsfwOnAttach(bool value) {
    if (isInstance) {
      instanceLocalPreferencesBloc.setValue(
        instanceSettingsData.copyWith(
          markMediaAsNsfwOnAttach: value,
        ),
      );
    } else {
      globalLocalPreferencesBloc.setValue(
        globalSettingsData.copyWith(
          markMediaAsNsfwOnAttach: value,
        ),
      );
    }
  }
}
