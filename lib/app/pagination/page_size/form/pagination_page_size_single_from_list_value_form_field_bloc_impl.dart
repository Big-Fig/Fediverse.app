import 'package:fedi/app/pagination/page_size/form/pagination_page_size_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

class PaginationPageSizeSingleFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<PaginationPageSize>
    implements IPaginationPageSizeSingleFromListValueFormFieldBloc {
  @override
  final List<PaginationPageSize> possibleValues;

  PaginationPageSizeSingleFromListValueFormFieldBloc({
    bool isNullValuePossible = false,
    this.possibleValues = PaginationPageSize.values,
    required PaginationPageSize originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<PaginationPageSize>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );
}
