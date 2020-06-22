import 'package:fedi/ui/form/form_key_value_pair_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_link_pair_field_bloc.dart';
import 'package:fedi/ui/form/form_string_field_bloc.dart';
import 'package:fedi/ui/form/form_string_field_bloc_impl.dart';
import 'package:flutter/widgets.dart';

class FormLinkPairFieldBloc extends FormKeyValuePairFieldBloc<
    IFormStringFieldBloc,
    IFormStringFieldBloc> implements IFormLinkPairFieldBloc {
  FormLinkPairFieldBloc({
    @required String name,
    @required String value,
  }) : super(
          keyField: FormStringFieldBloc(originValue: name),
          valueField: FormStringFieldBloc(originValue: value),
        );
}
