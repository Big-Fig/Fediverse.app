import 'package:fedi/app/cache/files/files_cache_model.dart';
import 'package:fedi/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/value_form_field_validation.dart';
import 'package:flutter/material.dart';

class SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc
    extends SingleSelectFromListValueFormFieldBloc<FilesCacheSizeLimitCountType>
    implements ISizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc {
  SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc({
    bool isNullValuePossible = true,
    @required FilesCacheSizeLimitCountType originValue,
    bool isEnabled = true,
    List<FormValueFieldValidation<FilesCacheSizeLimitCountType>> validators = const [],
  }) : super(
          originValue: originValue,
          isEnabled: isEnabled,
          validators: validators,
          isNullValuePossible: isNullValuePossible,
        );

  @override
  List<FilesCacheSizeLimitCountType> get possibleValues => FilesCacheSizeLimitCountType.values;
}
