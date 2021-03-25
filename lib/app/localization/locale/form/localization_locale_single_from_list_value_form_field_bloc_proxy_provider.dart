import 'package:fedi/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/localization/localization_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LocalizationLocaleSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  LocalizationLocaleSingleFromListValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ILocalizationLocaleSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<LocalizationLocale?>>(
        update: (context, value, previous) => value,
        child:
            SingleSelectFromListValueFormFieldBlocProxyProvider<LocalizationLocale?>(
          child: child,
        ),
      );
}
