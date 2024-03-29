import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/custom_list/form/custom_list_form_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi_app/form/form_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';

class CustomListFormBloc extends FormBloc implements ICustomListFormBloc {
  @override
  final StringValueFormFieldBloc titleField;

  CustomListFormBloc({required String? initialTitleValue})
      : titleField = StringValueFormFieldBloc(
          originValue: initialTitleValue ?? '',
          validators: [
            StringValueFormFieldNonEmptyValidationError.createValidator(),
          ],
          maxLength: null,
        ),
        super(isAllItemsInitialized: true) {
    titleField.disposeWith(this);
  }

  @override
  List<IFormItemBloc> get currentItems => [titleField];
}
