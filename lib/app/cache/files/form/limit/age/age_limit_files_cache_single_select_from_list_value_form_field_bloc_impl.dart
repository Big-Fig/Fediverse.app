import 'package:fedi/app/cache/files/cache/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';

class AgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<FilesCacheAgeLimitType?>
    implements IAgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc {
  AgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc({
    bool isNullValuePossible = false,
    required FilesCacheAgeLimitType? originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<FilesCacheAgeLimitType>> validators =
        const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );

  @override
  List<FilesCacheAgeLimitType> get possibleValues =>
      FilesCacheAgeLimitType.values;
}
