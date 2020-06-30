import 'package:fedi/ui/form/form_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IRegisterAuthInstanceBloc implements IFormBloc {
  static IRegisterAuthInstanceBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IRegisterAuthInstanceBloc>(context, listen: listen);

  FormStringFieldBloc get usernameFieldBloc;

  FormStringFieldBloc get emailFieldBloc;

  FormStringFieldBloc get passwordFieldBloc;

  FormStringFieldBloc get confirmPasswordFieldBloc;
}
