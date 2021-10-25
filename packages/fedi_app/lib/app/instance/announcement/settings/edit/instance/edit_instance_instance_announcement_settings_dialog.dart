import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/instance/announcement/settings/edit/edit_instance_announcement_settings_bloc.dart';
import 'package:fedi_app/app/instance/announcement/settings/edit/edit_instance_announcement_settings_bloc_impl.dart';
import 'package:fedi_app/app/instance/announcement/settings/edit/edit_instance_announcement_settings_widget.dart';
import 'package:fedi_app/app/instance/announcement/settings/instance_announcement_settings_bloc.dart';
import 'package:fedi_app/app/instance/announcement/settings/instance_announcement_settings_bloc_impl.dart';
import 'package:fedi_app/app/instance/announcement/settings/local_preferences/instance/instance_instance_announcement_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/settings/instance/edit/edit_instance_settings_dialog.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditInstanceInstanceAnnouncementSettingsDialog({
  required BuildContext context,
}) {
  showEditInstanceSettingsDialog(
    context: context,
    subTitle: S.of(context).app_instance_announcement_settings_title,
    child: DisposableProxyProvider<
        IInstanceInstanceAnnouncementSettingsLocalPreferenceBloc,
        IInstanceAnnouncementSettingsBloc>(
      update: (context, value, previous) => InstanceAnnouncementSettingsBloc(
        instanceLocalPreferencesBloc: value,
      ),
      child: DisposableProvider<IEditInstanceAnnouncementSettingsBloc>(
        create: (context) => EditInstanceAnnouncementSettingsBloc(
          instanceAnnouncementSettingsBloc:
              IInstanceAnnouncementSettingsBloc.of(
            context,
            listen: false,
          ),
          isEnabled: true,
        ),
        child: const EditInstanceAnnouncementSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
