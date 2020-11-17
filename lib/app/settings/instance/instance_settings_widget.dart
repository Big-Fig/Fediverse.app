import 'package:fedi/app/chat/settings/edit/global_or_instance/edit_global_or_instance_chat_settings_dialog.dart';
import 'package:fedi/app/media/settings/edit/global_or_instance/edit_global_or_instance_media_settings_dialog.dart';
import 'package:fedi/app/status/post/settings/edit/global_or_instance/edit_global_or_instance_post_status_settings_dialog.dart';
import 'package:fedi/app/status/sensitive/settings/edit/global_or_instance/edit_global_or_instance_status_sensitive_settings_dialog.dart';
import 'package:fedi/app/ui/selection/fedi_selection_item_row_widget.dart';
import 'package:fedi/app/web_sockets/settings/edit/global_or_instance/edit_global_or_instance_web_sockets_settings_dialog.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstanceSettingsWidget extends StatelessWidget {
  const InstanceSettingsWidget();

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _InstanceSettingsMediaRowWidget(),
          // const _InstanceSettingsToastRowWidget(),
          const _InstanceSettingsStatusSensitiveRowWidget(),
          const _InstanceStatusPostSensitiveRowWidget(),
          const _InstanceSettingsChatRowWidget(),
          const _InstanceSettingsWebSocketsRowWidget(),
        ],
      );
}

class _InstanceSettingsMediaRowWidget extends StatelessWidget {
  const _InstanceSettingsMediaRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_media_settings_title,
      onClick: () {
        showEditGlobalOrInstanceMediaSettingsDialog(context: context);
      },
    );
  }
}

// class _InstanceSettingsToastRowWidget extends StatelessWidget {
//   const _InstanceSettingsToastRowWidget({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SimpleFediSelectionItemRowWidget(
//       title: S.of(context).app_toast_settings_title,
//       onClick: () {
//         showEditGlobalOrInstanceToastSettingsDialog(context: context);
//       },
//     );
//   }
// }

class _InstanceSettingsStatusSensitiveRowWidget extends StatelessWidget {
  const _InstanceSettingsStatusSensitiveRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_status_sensitive_settings_title,
      onClick: () {
        showEditGlobalOrInstanceStatusSensitiveSettingsDialog(context: context);
      },
    );
  }
}

class _InstanceStatusPostSensitiveRowWidget extends StatelessWidget {
  const _InstanceStatusPostSensitiveRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_status_post_settings_title,
      onClick: () {
        showEditGlobalOrInstancePostStatusSettingsDialog(context: context);
      },
    );
  }
}

class _InstanceSettingsChatRowWidget extends StatelessWidget {
  const _InstanceSettingsChatRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_chat_settings_title,
      onClick: () {
        showEditGlobalOrInstanceChatSettingsDialog(context: context);
      },
    );
  }
}

class _InstanceSettingsWebSocketsRowWidget extends StatelessWidget {
  const _InstanceSettingsWebSocketsRowWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleFediSelectionItemRowWidget(
      title: S.of(context).app_web_sockets_settings_title,
      onClick: () {
        showEditGlobalOrInstanceWebSocketsSettingsDialog(context: context);
      },
    );
  }
}
