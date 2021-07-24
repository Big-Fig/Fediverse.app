import 'package:fedi/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi/app/instance/announcement/settings/edit/edit_instance_announcement_settings_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditInstanceAnnouncementSettingsWidget extends StatefulWidget {
  final bool shrinkWrap;

  const EditInstanceAnnouncementSettingsWidget({
    required this.shrinkWrap,
  });

  @override
  _EditInstanceAnnouncementSettingsWidgetState createState() =>
      _EditInstanceAnnouncementSettingsWidgetState();
}

class _EditInstanceAnnouncementSettingsWidgetState
    extends State<EditInstanceAnnouncementSettingsWidget> {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: widget.shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: [
          const _EditInstanceAnnouncementSettingsWithDismissedFieldWidget(),
        ],
      );
}

class _EditInstanceAnnouncementSettingsWithDismissedFieldWidget
    extends StatelessWidget {
  const _EditInstanceAnnouncementSettingsWithDismissedFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProxyProvider<IEditInstanceAnnouncementSettingsBloc,
        IBoolValueFormFieldBloc>(
      update: (context, value, previous) => value.withDismissedFieldBloc,
      child: BoolValueFormFieldRowWidget(
        label: S
            .of(context)
            .app_instance_announcement_settings_field_withDismissed_label,
        descriptionOnDisabled:
            S.of(context).app_settings_warning_notSupportedOnThisInstance_desc,
      ),
    );
  }
}
