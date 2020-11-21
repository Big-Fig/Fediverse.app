import 'package:fedi/form/field/value/string/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/url/url_string_value_form_field_validation.dart';
import 'package:fedi/form/group/pair/key_value_pair_form_group_bloc_impl.dart';
import 'package:fedi/form/group/pair/link_pair_form_group_bloc.dart';
import 'package:flutter/widgets.dart';

class LinkPairFormGroupBloc extends KeyValuePairFormGroupBloc<
    IStringValueFormFieldBloc,
    IStringValueFormFieldBloc> implements ILinkPairFormGroupBloc {
  LinkPairFormGroupBloc({
    @required String name,
    @required int nameMaxLength,
    @required String value,
    @required int valueMaxLength,
  }) : super(
          keyField: StringValueFormFieldBloc(
            originValue: name,
            validators: [
              StringValueFormFieldNonEmptyValidationError.createValidator(),
            ],
            maxLength: nameMaxLength,
          ),
          valueField: StringValueFormFieldBloc(
            originValue: value,
            validators: [UrlStringValueFormFieldValidationError.createValidator()],
            maxLength: valueMaxLength,
          ),
        );
}
