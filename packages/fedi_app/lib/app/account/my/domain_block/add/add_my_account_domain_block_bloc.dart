import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAddMyAccountDomainBlockBloc implements IFormBloc {
  static IAddMyAccountDomainBlockBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IAddMyAccountDomainBlockBloc>(context, listen: listen);

  IStringValueFormFieldBloc get domainField;

  Future<void> submit();
}
