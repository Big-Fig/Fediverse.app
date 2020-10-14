import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_url_string_field_validation.dart';
import 'package:fedi/ui/form/group/pair/form_key_value_pair_field_group_bloc_impl.dart';
import 'package:fedi/ui/form/group/pair/form_link_pair_field_group_bloc.dart';
import 'package:flutter/widgets.dart';

class FormLinkPairFieldGroupBloc extends FormKeyValuePairFieldGroupBloc<
    IFormStringFieldBloc,
    IFormStringFieldBloc> implements IFormLinkPairFieldGroupBloc {
  FormLinkPairFieldGroupBloc({
    @required String name,
    @required int nameMaxLength,
    @required String value,
    @required int valueMaxLength,
  }) : super(
          keyField: FormStringFieldBloc(
            originValue: name,
            validators: [
              NonEmptyStringFieldValidationError.createValidator(),
            ],
            maxLength: nameMaxLength,
          ),
          valueField: FormStringFieldBloc(
            originValue: value,
            validators: [FormUrlStringFieldValidationError.createValidator()],
            maxLength: valueMaxLength,
          ),
        );
}
