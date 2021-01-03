import 'package:fedi/app/cache/database/settings/edit/global/edit_global_database_cache_settings_dialog.dart';
import 'package:fedi/app/cache/files/settings/edit/global/edit_global_files_cache_settings_dialog.dart';
import 'package:fedi/app/chat/settings/edit/global/edit_global_chat_settings_dialog.dart';
import 'package:fedi/app/localization/settings/edit/global/edit_global_localization_settings_dialog.dart';
import 'package:fedi/app/media/settings/edit/global/edit_global_media_settings_dialog.dart';
import 'package:fedi/app/pagination/settings/edit/global/edit_global_pagination_settings_dialog.dart';
import 'package:fedi/app/status/post/settings/edit/global/edit_global_post_status_settings_dialog.dart';
import 'package:fedi/app/status/sensitive/settings/edit/global/edit_global_status_sensitive_settings_dialog.dart';
import 'package:fedi/app/toast/settings/edit/global/edit_global_toast_settings_dialog.dart';
import 'package:fedi/app/ui/selection/fedi_selection_item_row_widget.dart';
import 'package:fedi/app/ui/settings/edit/global/edit_global_ui_settings_dialog.dart';
import 'package:fedi/app/web_sockets/settings/edit/global/edit_global_web_sockets_settings_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalSettingsListWidget extends StatelessWidget {
  const GlobalSettingsListWidget();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _GlobalSettingsUiRowWidget(),
          const _GlobalSettingsLocalizationRowWidget(),
          const _GlobalSettingsPaginationRowWidget(),
          const _GlobalSettingsMediaRowWidget(),
          const _GlobalSettingsToastRowWidget(),
          const _GlobalSettingsStatusSensitiveRowWidget(),
          const _GlobalSettingsPostStatusRowWidget(),
          const _GlobalSettingsChatRowWidget(),
          const _GlobalSettingsWebSocketsRowWidget(),
          const _GlobalSettingsDatabaseCacheRowWidget(),
          const _GlobalSettingsFilesCacheRowWidget(),
        ],
      );
}

class _GlobalSettingsLocalizationRowWidget extends StatelessWidget {
  const _GlobalSettingsLocalizationRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_localization_settings_title,
      onClick: () {
        showEditGlobalLocalizationSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsUiRowWidget extends StatelessWidget {
  const _GlobalSettingsUiRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_ui_settings_title,
      onClick: () {
        showEditGlobalUiSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsPaginationRowWidget extends StatelessWidget {
  const _GlobalSettingsPaginationRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_pagination_settings_title,
      onClick: () {
        showEditGlobalPaginationSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsMediaRowWidget extends StatelessWidget {
  const _GlobalSettingsMediaRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_media_settings_title,
      onClick: () {
        showEditGlobalMediaSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsToastRowWidget extends StatelessWidget {
  const _GlobalSettingsToastRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_toast_settings_title,
      onClick: () {
        showEditGlobalToastSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsStatusSensitiveRowWidget extends StatelessWidget {
  const _GlobalSettingsStatusSensitiveRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_status_sensitive_settings_title,
      onClick: () {
        showEditGlobalStatusSensitiveSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsPostStatusRowWidget extends StatelessWidget {
  const _GlobalSettingsPostStatusRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_status_post_settings_title,
      onClick: () {
        showEditGlobalPostStatusSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsChatRowWidget extends StatelessWidget {
  const _GlobalSettingsChatRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_chat_settings_title,
      onClick: () {
        showEditGlobalChatSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsWebSocketsRowWidget extends StatelessWidget {
  const _GlobalSettingsWebSocketsRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_web_sockets_settings_title,
      onClick: () {
        showEditGlobalWebSocketsSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsDatabaseCacheRowWidget extends StatelessWidget {
  const _GlobalSettingsDatabaseCacheRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_cache_database_settings_title,
      onClick: () {
        showEditGlobalDatabaseCacheSettingsDialog(context: context);
      },
    );
  }
}

class _GlobalSettingsFilesCacheRowWidget extends StatelessWidget {
  const _GlobalSettingsFilesCacheRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_cache_files_settings_title,
      onClick: () {
        showEditGlobalFilesCacheSettingsDialog(context: context);
      },
    );
  }
}
