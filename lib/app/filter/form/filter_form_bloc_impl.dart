import 'package:fedi/app/auth/instance/auth_instance_model.dart';
import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc_impl.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/app/filter/form/filter_form_bloc.dart';
import 'package:fedi/duration/duration_extension.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_model.dart';
import 'package:fedi/form/field/value/select_from_list/multi/validation/multi_select_from_list_value_form_field_non_null_and_non_empty_validation.dart';
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

  final AuthInstance currentInstance;

  FilterFormBloc({
    @required IFilter initialValue,
    @required this.currentInstance,
  })  : phraseField = StringValueFormFieldBloc(
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
          validators: [
            MultiSelectFromListValueFormFieldNonNullAndNonEmptyValidationError
                .createValidator(),
          ],
          currentInstance: currentInstance,
        ),
        super(isAllItemsInitialized: false) {
    // strange logic from Pleroma/Mastodon
    // it is not possible to delete value from expiresIn field,
    // only change to not-null
    var isExpiresInNullValuePossible = initialValue?.expiresAt == null;
    expiresInField = DurationDateTimeValueFormFieldBloc(
      isEnabled: currentInstance.isMastodonInstance,
      isNullValuePossible: isExpiresInNullValuePossible,
      minDuration: Duration(minutes: 30),
      maxDuration: Duration(days: 365),
      originValue: DurationDateTime(
        dateTime: initialValue?.expiresAt,
        duration: null,
      ),
      validators: [],
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
  IPostPleromaFilter calculateFormValue() {
    return PostPleromaFilter(
      phrase: phraseField.currentValue,
      irreversible: irreversibleField.currentValue,
      wholeWord: wholeWordField.currentValue,
      expiresInSeconds: expiresInField.currentValueDuration?.totalSeconds,
      context: contextField.currentValue
          ?.where(
              (contextType) => contextType != MastodonFilterContextType.unknown)
          ?.map(
            (contextType) => contextType.toJsonValue(),
          )
          ?.toList(),
    );
  }
}
