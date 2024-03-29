import 'package:fedi_app/app/ui/settings/font_size/form/ui_settings_font_size_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UiSettingsFontSizeSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const UiSettingsFontSizeSingleFromListValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IUiSettingsFontSizeSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<UiSettingsFontSize>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            UiSettingsFontSize>(
          child: child,
        ),
      );
}
