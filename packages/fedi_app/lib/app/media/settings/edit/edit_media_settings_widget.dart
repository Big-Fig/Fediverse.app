import 'package:fedi_app/app/form/field/value/bool/bool_value_form_field_row_widget.dart';
import 'package:fedi_app/app/media/settings/edit/edit_media_settings_bloc.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditMediaSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditMediaSettingsWidget({
    Key? key,
    required this.shrinkWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: const [
          _EditMediaSettingsAutoInitFieldWidget(),
          _EditMediaSettingsAutoPlayFieldWidget(),
        ],
      );
}

class _EditMediaSettingsAutoPlayFieldWidget extends StatelessWidget {
  const _EditMediaSettingsAutoPlayFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditMediaSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.autoPlayFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_media_settings_field_autoPlay_label,
        ),
      );
}

class _EditMediaSettingsAutoInitFieldWidget extends StatelessWidget {
  const _EditMediaSettingsAutoInitFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ProxyProvider<IEditMediaSettingsBloc, IBoolValueFormFieldBloc>(
        update: (context, value, previous) => value.autoInitFieldBloc,
        child: BoolValueFormFieldRowWidget(
          label: S.of(context).app_media_settings_field_autoInit_label,
        ),
      );
}
