import 'package:fedi_app/app/access/current/current_access_bloc.dart';
import 'package:fedi_app/app/async/unifedi/unifedi_async_operation_button_builder_widget.dart';
import 'package:fedi_app/app/cache/files/files_cache_service.dart';
import 'package:fedi_app/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi_app/app/cache/files/settings/edit/edit_files_cache_settings_bloc.dart';
import 'package:fedi_app/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi_app/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:fediverse_api/fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditFilesCacheSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditFilesCacheSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editFilesCacheSettingsBloc = IEditFilesCacheSettingsBloc.of(context);
    var isGlobalForced = editFilesCacheSettingsBloc.isGlobalForced;

    return Column(
      mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
      children: [
        const _EditFilesCacheSettingsDescriptionWidget(),
        const _EditFilesCacheSettingsMaxSizeLimitFieldWidget(),
        const _AgeLimitFilesCacheDurationValueFormFieldRowWidget(),
        if (!isGlobalForced)
          const _EditFilesCacheSettingsClearAllButtonWidget(),
      ],
    );
  }
}

class _EditFilesCacheSettingsClearAllButtonWidget extends StatelessWidget {
  const _EditFilesCacheSettingsClearAllButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentUnifediApiAccessBloc = ICurrentAccessBloc.of(context);
    var filesCacheService = IFilesCacheService.of(context);

    return UnifediAsyncOperationButtonBuilderWidget<void>(
      asyncButtonAction: () => filesCacheService.clear(),
      builder: (context, onPressed) => FediPrimaryFilledTextButtonWithBorder(
        S.of(context).app_cache_settings_action_clear_all_now(
              currentUnifediApiAccessBloc.currentInstance!.userAtHost,
            ),
        onPressed: onPressed,
        expanded: false,
      ),
    );
  }
}

class _EditFilesCacheSettingsDescriptionWidget extends StatelessWidget {
  const _EditFilesCacheSettingsDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => FediNoteDescriptionWidget(
        S.of(context).app_cache_files_settings_description,
      );
}

class _EditFilesCacheSettingsMaxSizeLimitFieldWidget extends StatelessWidget {
  const _EditFilesCacheSettingsMaxSizeLimitFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditFilesCacheSettingsBloc,
          ISizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc>(
        update: (context, value, previous) => value
            .sizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc,
        child:
            const SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldRowWidget(),
      );
}

class _AgeLimitFilesCacheDurationValueFormFieldRowWidget
    extends StatelessWidget {
  const _AgeLimitFilesCacheDurationValueFormFieldRowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditFilesCacheSettingsBloc,
          IAgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.ageLimitFilesSelectCacheSingleSelectValueFormFieldBloc,
        child:
            const AgeLimitFilesCacheSingleSelectFromListValueFormFieldRowWidget(),
      );
}
