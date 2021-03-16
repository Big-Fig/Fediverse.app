import 'package:fedi/app/ui/settings/font_size/form/ui_settings_font_size_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/ui/settings/font_size/ui_settings_font_size_model.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UiSettingsFontSizeSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  UiSettingsFontSizeSingleFromListValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IUiSettingsFontSizeSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<UiSettingsFontSize?>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            UiSettingsFontSize?>(
          child: child,
        ),
      );
}
