import 'package:fedi_app/app/localization/locale/form/localization_locale_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi_app/localization/localization_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LocalizationLocaleSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const LocalizationLocaleSingleFromListValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ILocalizationLocaleSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<LocalizationLocale?>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            LocalizationLocale?>(
          child: child,
        ),
      );
}
