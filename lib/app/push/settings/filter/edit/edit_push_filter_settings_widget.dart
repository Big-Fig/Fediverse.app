import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/push/settings/filter/edit/edit_push_filter_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditPushFilterSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditPushFilterSettingsWidget({
    required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: const [
          _EditPushFilterSettingsHideNotificationContentsFieldWidget(),
          _EditPushFilterSettingsBlockFromStrangersFieldWidget(),
        ],
      );
}

class _EditPushFilterSettingsBlockFromStrangersFieldWidget
    extends StatelessWidget {
  const _EditPushFilterSettingsBlockFromStrangersFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushFilterSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.blockFromStrangersFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_push_filter_settings_field_blockFromStrangers_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}

class _EditPushFilterSettingsHideNotificationContentsFieldWidget
    extends StatelessWidget {
  const _EditPushFilterSettingsHideNotificationContentsFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditPushFilterSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) =>
            value.hideNotificationContentsFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_push_filter_settings_field_hideNotificationContents_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}
