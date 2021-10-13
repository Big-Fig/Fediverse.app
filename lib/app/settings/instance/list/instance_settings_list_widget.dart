import 'package:fedi/app/cache/database/settings/edit/global_or_instance/edit_global_or_instance_database_cache_settings_dialog.dart';
import 'package:fedi/app/cache/files/settings/edit/global_or_instance/edit_global_or_instance_files_cache_settings_dialog.dart';
import 'package:fedi/app/chat/settings/edit/global_or_instance/edit_global_or_instance_chat_settings_dialog.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/crash_reporting/settings/edit/global/edit_global_crash_reporting_settings_dialog.dart';
import 'package:fedi/app/localization/settings/edit/global/edit_global_localization_settings_dialog.dart';
import 'package:fedi/app/media/settings/edit/global_or_instance/edit_global_or_instance_media_settings_dialog.dart';
import 'package:fedi/app/pagination/settings/edit/global_or_instance/edit_global_or_instance_pagination_settings_dialog.dart';
import 'package:fedi/app/push/settings/edit/instance/edit_instance_push_settings_dialog.dart';
import 'package:fedi/app/settings/instance/list/instance_settings_list_widget_keys.dart';
import 'package:fedi/app/status/post/settings/edit/global_or_instance/edit_global_or_instance_post_status_settings_dialog.dart';
import 'package:fedi/app/status/sensitive/settings/edit/global_or_instance/edit_global_or_instance_status_sensitive_settings_dialog.dart';
import 'package:fedi/app/toast/settings/edit/global_or_instance/edit_global_or_instance_toast_settings_dialog.dart';
import 'package:fedi/app/ui/selection/fedi_selection_item_row_widget.dart';
import 'package:fedi/app/ui/settings/edit/global/edit_global_ui_settings_dialog.dart';
import 'package:fedi/app/web_sockets/settings/edit/global_or_instance/edit_global_or_instance_web_sockets_settings_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstanceSettingsListWidget extends StatelessWidget {
  const InstanceSettingsListWidget();

  @override
  Widget build(BuildContext context) {
    var configService = IConfigService.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _GlobalSettingsUiRowWidget(
          key: Key(InstanceSettingsListWidgetKeys.instanceSettingsUiRowWidget),
        ),
        const _GlobalSettingsLocalizationRowWidget(),
        const _InstanceSettingsCacheAndPaginationRowWidget(),
        if (configService.pushFcmEnabled)
          const _InstanceSettingsPushRowWidget(),
        const _InstanceSettingsMediaRowWidget(),
        const _InstanceSettingsToastRowWidget(),
        const _InstanceSettingsStatusSensitiveRowWidget(),
        const _InstanceStatusPostSensitiveRowWidget(),
        const _InstanceSettingsChatRowWidget(),
        const _InstanceSettingsWebSocketsRowWidget(),
        const _InstanceSettingsDatabaseCacheRowWidget(),
        const _InstanceSettingsFilesCacheRowWidget(),
        if (IConfigService.of(context, listen: false).crashlyticsEnabled)
          const _GlobalSettingsCrashReportingRowWidget(),
      ],
    );
  }
}

class _GlobalSettingsLocalizationRowWidget extends StatelessWidget {
  const _GlobalSettingsLocalizationRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_localization_settings_title,
        onClick: () {
          showEditGlobalLocalizationSettingsDialog(context: context);
        },
      );
}

class _GlobalSettingsUiRowWidget extends StatelessWidget {
  const _GlobalSettingsUiRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_ui_settings_title,
        onClick: () {
          showEditGlobalUiSettingsDialog(context: context);
        },
      );
}

class _GlobalSettingsCrashReportingRowWidget extends StatelessWidget {
  const _GlobalSettingsCrashReportingRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_crashReporting_settings_title,
        onClick: () {
          showEditGlobalCrashReportingSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsMediaRowWidget extends StatelessWidget {
  const _InstanceSettingsMediaRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_media_settings_title,
        onClick: () {
          showEditGlobalOrInstanceMediaSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsCacheAndPaginationRowWidget extends StatelessWidget {
  const _InstanceSettingsCacheAndPaginationRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_pagination_settings_title,
        onClick: () {
          showEditGlobalOrInstancePaginationSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsPushRowWidget extends StatelessWidget {
  const _InstanceSettingsPushRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_push_settings_title,
        onClick: () {
          showEditInstancePushSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsToastRowWidget extends StatelessWidget {
  const _InstanceSettingsToastRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_toast_settings_title,
        onClick: () {
          showEditGlobalOrInstanceToastSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsStatusSensitiveRowWidget extends StatelessWidget {
  const _InstanceSettingsStatusSensitiveRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_status_sensitive_settings_title,
        onClick: () {
          showEditGlobalOrInstanceStatusSensitiveSettingsDialog(
            context: context,
          );
        },
      );
}

class _InstanceStatusPostSensitiveRowWidget extends StatelessWidget {
  const _InstanceStatusPostSensitiveRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_status_post_settings_title,
        onClick: () {
          showEditGlobalOrInstancePostStatusSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsChatRowWidget extends StatelessWidget {
  const _InstanceSettingsChatRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_chat_settings_title,
        onClick: () {
          showEditGlobalOrInstanceChatSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsWebSocketsRowWidget extends StatelessWidget {
  const _InstanceSettingsWebSocketsRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_web_sockets_settings_title,
        onClick: () {
          showEditGlobalOrInstanceWebSocketsSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsDatabaseCacheRowWidget extends StatelessWidget {
  const _InstanceSettingsDatabaseCacheRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_cache_database_settings_title,
        onClick: () {
          showEditGlobalOrInstanceDatabaseCacheSettingsDialog(context: context);
        },
      );
}

class _InstanceSettingsFilesCacheRowWidget extends StatelessWidget {
  const _InstanceSettingsFilesCacheRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleFediSelectionItemRowWidget(
        title: S.of(context).app_cache_files_settings_title,
        onClick: () {
          showEditGlobalOrInstanceFilesCacheSettingsDialog(context: context);
        },
      );
}
