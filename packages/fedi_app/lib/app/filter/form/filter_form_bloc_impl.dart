import 'package:easy_dispose/easy_dispose.dart';

import 'package:fedi_app/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi_app/app/filter/filter_model.dart';
import 'package:fedi_app/app/filter/form/filter_form_bloc.dart';

import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/duration/date_time/duration_date_time_value_form_field_model.dart';
import 'package:fedi_app/form/field/value/select_from_list/multi/validation/multi_select_from_list_value_form_field_non_null_and_non_empty_validation.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi_app/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi_app/form/form_bloc_impl.dart';
import 'package:fedi_app/form/form_item_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';

final _wholeWordRegex = RegExp(r'^[a-zA-Z0-9_]+$');

class FilterFormBloc extends FormBloc implements IFilterFormBloc {
  @override
  final StringValueFormFieldBloc phraseField;

  @override
  final BoolValueFormFieldBloc irreversibleField;
  @override
  final BoolValueFormFieldBloc wholeWordField;
  @override
  // ignore: avoid-late-keyword
  late DurationDateTimeValueFormFieldBloc expiresInField;

  @override
  final FilterContextMultiSelectFromListValueFormFieldBloc contextField;

  final UnifediApiAccess currentInstance;

  FilterFormBloc({
    required IFilter? initialValue,
    required this.currentInstance,
  })  : phraseField = StringValueFormFieldBloc(
          originValue: initialValue?.phrase ?? '',
          validators: [
            StringValueFormFieldNonEmptyValidationError.createValidator(),
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
          originValue: initialValue?.contextAsUnifediApiFilterContextType ?? [],
          validators: [
            MultiSelectFromListValueFormFieldNonNullAndNonEmptyValidationError
                .createValidator(),
          ],
          currentInstance: currentInstance,
        ),
        super(isAllItemsInitialized: false) {
    // strange logic from Unifedi/Mastodon
    // it is not possible to delete value from expiresIn field,
    // only change to not-null
    var isExpiresInNullValuePossible = initialValue?.expiresAt == null;
    expiresInField = DurationDateTimeValueFormFieldBloc(
      isEnabled: true,
      isNullValuePossible: isExpiresInNullValuePossible,
      // ignore: no-magic-number
      minDuration: const Duration(minutes: 30),
      // ignore: no-magic-number
      maxDuration: const Duration(days: 365),
      originValue: DurationDateTime(
        dateTime: initialValue?.expiresAt,
        duration: null,
      ),
      validators: [],
    );

    phraseField.disposeWith(this);
    irreversibleField.disposeWith(this);
    wholeWordField.disposeWith(this);
    expiresInField.disposeWith(this);
    contextField.disposeWith(this);

    phraseField.currentValueStream.listen(
      (phrase) {
        if (phrase.isNotEmpty) {
          var hasMatch = _wholeWordRegex.hasMatch(phrase);
          wholeWordField.changeIsEnabled(hasMatch);
        } else {
          wholeWordField.changeIsEnabled(false);
        }
      },
    ).disposeWith(this);

    onFormItemsChanged();
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
  IUnifediApiPostFilter calculateFormValue() => UnifediApiPostFilter(
        phrase: phraseField.currentValue,
        irreversible: irreversibleField.currentValue ?? false,
        wholeWord: wholeWordField.currentValue ?? false,
        expiresIn: expiresInField.currentValueDuration,
        context: contextField.currentValue
            .where(
              (UnifediApiFilterContextType contextType) => contextType.maybeMap(
                unknown: (_) => false,
                orElse: () => true,
              ),
            )
            .map(
              (contextType) => contextType.stringValue,
            )
            .toList(),
      );
}
