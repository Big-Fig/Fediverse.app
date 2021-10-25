import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/pagination/settings/edit/edit_pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/edit/edit_pagination_settings_bloc_impl.dart';
import 'package:fedi_app/app/pagination/settings/edit/edit_pagination_settings_widget.dart';
import 'package:fedi_app/app/pagination/settings/local_preferences/global/global_pagination_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/pagination/settings/local_preferences/instance/instance_pagination_settings_local_preference_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc_impl.dart';
import 'package:fedi_app/app/settings/global/edit/edit_global_settings_dialog.dart';
import 'package:fedi_app/app/settings/global_or_instance/global_or_instance_settings_model.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditGlobalPaginationSettingsDialog({
  required BuildContext context,
}) {
  showEditGlobalSettingsDialog(
    context: context,
    subTitle: S.of(context).app_pagination_settings_title,
    child: DisposableProvider<IPaginationSettingsBloc>(
      create: (context) => PaginationSettingsBloc(
        instanceLocalPreferencesBloc:
            IInstancePaginationSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
        globalLocalPreferencesBloc:
            IGlobalPaginationSettingsLocalPreferenceBloc.of(
          context,
          listen: false,
        ),
      ),
      child: DisposableProxyProvider<IPaginationSettingsBloc,
          IEditPaginationSettingsBloc>(
        update: (context, value, previous) => EditPaginationSettingsBloc(
          isGlobalForced: true,
          paginationSettingsBloc: value,
          globalOrInstanceSettingsType: GlobalOrInstanceSettingsType.global,
          isEnabled: true,
        ),
        child: const EditPaginationSettingsWidget(
          shrinkWrap: true,
        ),
      ),
    ),
  );
}
