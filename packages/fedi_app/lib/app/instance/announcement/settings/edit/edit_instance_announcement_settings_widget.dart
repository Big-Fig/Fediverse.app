import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/app/instance/announcement/settings/edit/edit_instance_announcement_settings_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditInstanceAnnouncementSettingsWidget extends StatefulWidget {
  final bool shrinkWrap;

  const EditInstanceAnnouncementSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  EditInstanceAnnouncementSettingsWidgetState createState() =>
      EditInstanceAnnouncementSettingsWidgetState();
}

class EditInstanceAnnouncementSettingsWidgetState
    extends State<EditInstanceAnnouncementSettingsWidget> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: widget.shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: const [
          _EditInstanceAnnouncementSettingsWithDismissedFieldWidget(),
        ],
      );
}

class _EditInstanceAnnouncementSettingsWithDismissedFieldWidget
    extends StatelessWidget {
  const _EditInstanceAnnouncementSettingsWithDismissedFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditInstanceAnnouncementSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.withDismissedFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S
              .of(context)
              .app_instance_announcement_settings_field_withDismissed_label,
          descriptionOnDisabled: S
              .of(context)
              .app_settings_warning_notSupportedOnThisInstance_desc,
        ),
      );
}
