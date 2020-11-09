import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IAddMyAccountDomainBlockBloc implements IFormBloc {
  static IAddMyAccountDomainBlockBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IAddMyAccountDomainBlockBloc>(context, listen: listen);

  IFormStringFieldBloc get domainField;

  Future submit();
}
