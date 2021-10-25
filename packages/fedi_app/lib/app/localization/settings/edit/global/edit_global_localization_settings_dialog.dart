import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/localization/settings/edit/edit_localization_settings_bloc.dart';
import 'package:fedi_app/app/localization/settings/edit/edit_localization_settings_bloc_impl.dart';
import 'package:fedi_app/app/localization/settings/edit/edit_localization_settings_widget.dart';
import 'package:fedi_app/app/localization/settings/localization_settings_bloc.dart';
import 'package:fedi_app/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalLocalizationSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: null,
    subTitleBuilder: (context) => S.of(context).app_localization_settings_title,
    child: DisposableProvider<IEditLocalizationSettingsBloc>(
      create: (context) => EditLocalizationSettingsBloc(
        localizationSettingsBloc: ILocalizationSettingsBloc.of(
          context,
          listen: false,
        ),
        isEnabled: true,
      ),
      child: const EditLocalizationSettingsWidget(
        shrinkWrap: true,
      ),
    ),
  );
}
