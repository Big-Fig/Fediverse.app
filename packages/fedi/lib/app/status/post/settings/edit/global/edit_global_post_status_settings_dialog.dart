import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/access/current/current_access_bloc.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_bloc_impl.dart';
import 'package:fedi/app/status/post/settings/edit/edit_post_status_settings_widget.dart';
import 'package:fedi/app/status/post/settings/local_preferences/global/global_post_status_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/post/settings/local_preferences/instance/instance_post_status_settings_local_preference_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc.dart';
import 'package:fedi/app/status/post/settings/post_status_settings_bloc_impl.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unifedi_api/unifedi_api.dart';

void showEditGlobalPostStatusSettingsDialog({
  required BuildContext context,
}) {
  var isPleromaInstance = ICurrentUnifediApiAccessBloc.of(
    context,
    listen: false,
  ).currentInstance!.isPleroma;

  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_status_post_settings_title,
    child: DisposableProvider<IPostStatusSettingsBloc>(
      create: (context) => PostStatusSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstancePostStatusSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        globalLocalPreferencesBloc:
            IGlobalPostStatusSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
      ),
      child: DisposableProxyProvider<IPostStatusSettingsBloc,
          IEditPostStatusSettingsBloc>(
        update: (context, value, previous) => EditPostStatusSettingsBloc(
          isGlobalForced: true,
          postStatusSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          isEnabled: true,
          // ignore: no-equal-then-else
          unifediVisibilityPossibleValues: isPleromaInstance
              ? [
                  UnifediApiVisibility.publicValue,
                  UnifediApiVisibility.unlistedValue,
                  UnifediApiVisibility.directValue,
                  UnifediApiVisibility.privateValue,
                  // dont support unifedi-only visibility for global settings
                  // UnifediVisibility.list,
                  // UnifediVisibility.local,
                ]
              : [
                  UnifediApiVisibility.publicValue,
                  UnifediApiVisibility.unlistedValue,
                  UnifediApiVisibility.directValue,
                  UnifediApiVisibility.privateValue,
                ],
        ),
        child: const EditPostStatusSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
