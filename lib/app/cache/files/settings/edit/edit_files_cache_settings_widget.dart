import 'package:fedi/app/async/pleroma_async_operation_button_builder_widget.dart';
import 'package:fedi/app/auth/instance/current/current_auth_instance_bloc.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/cache/files/settings/edit/edit_files_cache_settings_bloc.dart';
import 'package:fedi/app/ui/button/text/with_border/fedi_primary_filled_text_button_with_border.dart';
import 'package:fedi/app/ui/description/fedi_note_description_widget.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditFilesCacheSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditFilesCacheSettingsWidget({
    required this.shrinkWrap,
  });

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
    var currentAuthInstanceBloc = ICurrentAuthInstanceBloc.of(context);
    var filesCacheService = IFilesCacheService.of(context);
    return PleromaAsyncOperationButtonBuilderWidget(
      asyncButtonAction: () => filesCacheService.clear(),
      builder: (context, onPressed) => FediPrimaryFilledTextButtonWithBorder(
        S.of(context).app_cache_settings_action_clear_all_now(
              currentAuthInstanceBloc.currentInstance!.userAtHost,
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
