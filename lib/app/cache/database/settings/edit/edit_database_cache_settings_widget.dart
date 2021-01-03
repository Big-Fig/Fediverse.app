import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/cache/database/form/info/instance/current_max_age/current_max_age_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi/app/cache/database/form/info/instance/current_max_age/current_max_age_instance_database_cache_info_form_field_row_widget.dart';
import 'package:fedi/app/cache/database/form/info/instance/current_max_entries_count_by_type/current_max_entries_count_by_type_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi/app/cache/database/form/info/instance/current_max_entries_count_by_type/current_max_entries_count_by_type_instance_database_cache_info_form_field_row_widget.dart';
import 'package:fedi/app/cache/database/form/limit/age/age_limit_database_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/cache/database/form/limit/age/age_limit_database_cache_single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/cache/database/form/limit/entries_count_by_type/entries_count_by_type_limit_database_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/cache/database/form/limit/entries_count_by_type/entries_count_by_type_limit_database_cache_single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/cache/database/settings/edit/edit_database_cache_settings_bloc.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi/app/ui/spacer/fedi_big_vertical_spacer.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditDatabaseCacheSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditDatabaseCacheSettingsWidget({
    @required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) {
    var editDatabaseCacheSettingsBloc =
        IEditDatabaseCacheSettingsBloc.of(context);
    var isGlobalForced = editDatabaseCacheSettingsBloc.isGlobalForced;

    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const _EditDatabaseCacheSettingsDescriptionWidget(),
        if (!isGlobalForced) ...[
          const _EditDatabaseCacheSettingsCurrentMaxEntriesCountByTypeFieldWidget(),
          const _EditDatabaseCacheSettingsCurrentMaxAgeFieldWidget(),
        ],
        const _EditDatabaseCacheSettingsAgeLimitFieldWidget(),
        const _EditDatabaseCacheSettingsEntriesCountByTypeLimitFieldWidget(),
        if (!isGlobalForced) ...[
          const _EditDatabaseCacheSettingsClearAllButtonWidget(),
          const FediBigVerticalSpacer(),
          const _EditDatabaseCacheSettingsClearByLimitsButtonWidget(),
        ],
      ],
    );
  }
}

class _EditDatabaseCacheSettingsDescriptionWidget extends StatelessWidget {
  const _EditDatabaseCacheSettingsDescriptionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FediNoteDescriptionWidget(
        S.of(context).app_cache_database_settings_description);
  }
}

class _EditDatabaseCacheSettingsClearAllButtonWidget extends StatelessWidget {
  const _EditDatabaseCacheSettingsClearAllButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    var editDatabaseCacheSettingsBloc =
        IEditDatabaseCacheSettingsBloc.of(context);
    return PleromaAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () => editDatabaseCacheSettingsBloc.clearAll(),
      builder: (context, onPressed) => FediPrimaryFilledTextButtonWithBorder(
        S.of(context).app_cache_settings_action_clear_all_now(
              currentAuthInstanceBloc.currentInstance.userAtHost,
            ),
        onPressed: onPressed,
        expanded: false,
      ),
    );
  }
}

class _EditDatabaseCacheSettingsClearByLimitsButtonWidget
    extends StatelessWidget {
  const _EditDatabaseCacheSettingsClearByLimitsButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    var editDatabaseCacheSettingsBloc =
        IEditDatabaseCacheSettingsBloc.of(context);
    return PleromaAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () => editDatabaseCacheSettingsBloc.clearByLimits(),
      builder: (context, onPressed) => FediPrimaryFilledTextButtonWithBorder(
        S.of(context).app_cache_settings_action_clear_by_limits_now(
              currentAuthInstanceBloc.currentInstance.userAtHost,
            ),
        onPressed: onPressed,
        expanded: false,
      ),
    );
  }
}

class _EditDatabaseCacheSettingsCurrentMaxEntriesCountByTypeFieldWidget
    extends StatelessWidget {
  const _EditDatabaseCacheSettingsCurrentMaxEntriesCountByTypeFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditDatabaseCacheSettingsBloc,
          ICurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc>(
        update: (context, value, previous) =>
            value.currentMaxEntriesCountByTypeDatabaseCacheInfoFormFieldBloc,
        child:
            const CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldRowWidget(),
      );
}

class _EditDatabaseCacheSettingsCurrentMaxAgeFieldWidget
    extends StatelessWidget {
  const _EditDatabaseCacheSettingsCurrentMaxAgeFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditDatabaseCacheSettingsBloc,
          ICurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBloc>(
        update: (context, value, previous) =>
            value.currentMaxAgeDatabaseCacheInfoFormFieldBloc,
        child: const CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldRowWidget(),
      );
}

class _EditDatabaseCacheSettingsAgeLimitFieldWidget extends StatelessWidget {
  const _EditDatabaseCacheSettingsAgeLimitFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditDatabaseCacheSettingsBloc,
          IAgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.ageLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc,
        child:
            const AgeLimitDatabaseCacheSingleSelectFromListValueFormFieldRowWidget(),
      );
}

class _EditDatabaseCacheSettingsEntriesCountByTypeLimitFieldWidget
    extends StatelessWidget {
  const _EditDatabaseCacheSettingsEntriesCountByTypeLimitFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditDatabaseCacheSettingsBloc,
          IEntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc>(
        update: (context, value, previous) => value
            .entriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc,
        child:
            const EntriesCountByTypeLimitDatabaseCacheSingleSelectValueFormFieldRowWidget(),
      );
}
