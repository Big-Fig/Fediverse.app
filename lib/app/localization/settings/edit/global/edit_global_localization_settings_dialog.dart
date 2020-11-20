import 'package:fedi/app/localization/settings/edit/edit_localization_settings_bloc.dart';
import 'package:fedi/app/localization/settings/edit/edit_localization_settings_bloc_impl.dart';
import 'package:fedi/app/localization/settings/edit/edit_localization_settings_widget.dart';
import 'package:fedi/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalLocalizationSettingsDialog({
  @required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_localization_settings_title,
    child: DisposableProvider<IEditLocalizationSettingsBloc>(
      create: (context) => EditLocalizationSettingsBloc(
        localizationSettingBloc: ILocalizationSettingsBloc.of(
          context,
          listen: false,
        ),
        enabled: true,
      ),
      child: const EditLocalizationSettingsWidget(
        shrinkWrap: true,
      ),
    ),
  );
}
