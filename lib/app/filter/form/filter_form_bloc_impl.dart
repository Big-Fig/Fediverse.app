import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/mastodon/filter/mastodon_filter_model.dart';
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
  DurationDateTimeValueFormFieldBloc expiresInField;

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
        contextField = FilterContextMultiSelectFromListValueFormFieldBloc(
          originValue: initialValue?.contextAsMastodonFilterContextType,
          validators: [],
        ),
        super(isAllItemsInitialized: false) {
    expiresInField = DurationDateTimeValueFormFieldBloc(
      isEnabled: true,
      isNullValuePossible: true,
      minDuration: Duration(minutes: 30),
      maxDuration: Duration(days: 365),
      originValue: null,
      originalDateTime: initialValue.expiresAt,
    );

    addDisposable(disposable: phraseField);
    addDisposable(disposable: irreversibleField);
    addDisposable(disposable: wholeWordField);
    addDisposable(disposable: expiresInField);
    addDisposable(disposable: contextField);

    addDisposable(
      streamSubscription: phraseField.currentValueStream.listen(
        (phrase) {
          var hasMatch = _wholeWordRegex.hasMatch(phrase ?? "");
          wholeWordField.changeIsEnabled(hasMatch);
        },
      ),
    );
    onItemsChanged();
  }

  @override
  List<IFormItemBloc> get currentItems => [
        phraseField,
        irreversibleField,
        wholeWordField,
        expiresInField,
        contextField,
      ];

  @override
  IPostPleromaFilter calculateFormValue() => PostPleromaFilter(
        phrase: phraseField.currentValue,
        irreversible: irreversibleField.currentValue,
        wholeWord: wholeWordField.currentValue,
        expiresInSeconds: expiresInField.currentValueInTotalSeconds,
        context: contextField.currentValue
            ?.map((contextType) => contextType.toJsonValue())
            ?.toList(),
      );
}
