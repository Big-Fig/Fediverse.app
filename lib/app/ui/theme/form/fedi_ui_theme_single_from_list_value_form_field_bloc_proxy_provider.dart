import 'package:fedi/app/ui/theme/fedi_ui_theme_model.dart';
import 'package:fedi/app/ui/theme/form/fedi_ui_theme_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class FediUiThemeSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const FediUiThemeSingleFromListValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IFediUiThemeSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<IFediUiTheme?>>(
        update: (context, value, previous) => value,
        child:
            SingleSelectFromListValueFormFieldBlocProxyProvider<IFediUiTheme?>(
          child: child,
        ),
      );
}
