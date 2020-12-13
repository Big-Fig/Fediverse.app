import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/filter_model_adapter.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/date_time/date_time_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/pleroma/filter/pleroma_filter_model.dart';
import 'package:flutter/widgets.dart';

final _wholeWordRegex = RegExp(r'^[a-zA-Z0-9_]+$');

class FilterFormBloc extends FormBloc implements IFilterFormBloc {
  @override
  final StringValueFormFieldBloc phraseField;

  @override
  final BoolValueFormFieldBloc irreversibleField;
  @override
  final BoolValueFormFieldBloc wholeWordField;
  @override
  final DateTimeValueFormFieldBloc expiresAtField;

  @override
  final FilterContextMultiSelectFromListValueFormFieldBloc contextField;

  FilterFormBloc({@required IFilter initialValue})
      : phraseField = StringValueFormFieldBloc(
          originValue: initialValue?.phrase,
          validators: [
            StringValueFormFieldNonEmptyValidationError.createValidator()
          ],
          maxLength: null,
        ),
        irreversibleField = BoolValueFormFieldBloc(
          originValue: initialValue?.irreversible ?? false,
        ),
        wholeWordField = BoolValueFormFieldBloc(
          originValue: initialValue?.wholeWord ?? false,
        ),
        expiresAtField = DateTimeValueFormFieldBloc(
          originValue: initialValue?.expiresAt,
          minDateTime: DateTime.now(),
          maxDateTime: null,
          isNullValuePossible: true,
        ),
        contextField = FilterContextMultiSelectFromListValueFormFieldBloc(
          originValue: initialValue?.contextAsMastodonFilterContextType,
          validators: [],
        ),
        super(isAllItemsInitialized: true) {
    addDisposable(disposable: phraseField);
    addDisposable(disposable: irreversibleField);
    addDisposable(disposable: wholeWordField);
    addDisposable(disposable: expiresAtField);
    addDisposable(disposable: contextField);

    addDisposable(
      streamSubscription: phraseField.currentValueStream.listen(
        (phrase) {
          var hasMatch = _wholeWordRegex.hasMatch(phrase ?? "");
          wholeWordField.changeIsEnabled(hasMatch);
        },
      ),
    );
  }

  @override
  List<IFormItemBloc> get currentItems => [
        phraseField,
        irreversibleField,
        wholeWordField,
        expiresAtField,
        contextField,
      ];

  @override
  IFilter calculateFormValue() {
    return mapRemoteFilterToLocalFilter(
      PleromaFilter(
        id: null,
        phrase: phraseField.currentValue,
        irreversible: irreversibleField.currentValue,
        wholeWord: wholeWordField.currentValue,
        expiresAt: expiresAtField.currentValue,
        context: [],
      ),
    );
  }
}
