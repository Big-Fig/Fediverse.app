import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_model.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc_impl.dart';
import 'package:fedi/form/field/value/string/validation/string_value_form_field_non_empty_validation.dart';
import 'package:fedi/form/form_bloc_impl.dart';
import 'package:fedi/form/form_item_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc_impl.dart';
import 'package:unifedi_api/unifedi_api.dart';

class PostStatusPollBloc extends FormBloc implements IPostStatusPollBloc {
  static DurationDateTimeValueFormFieldBloc createDurationDateTimeLengthBloc(
    IUnifediApiInstancePollLimits? pollLimit,
  ) =>
      DurationDateTimeValueFormFieldBloc(
        originValue: DurationDateTime(
          duration: Duration(days: 1),
          dateTime: null,
        ),
        minDuration: pollLimit?.minExpirationDuration,
        maxDuration: pollLimit?.maxExpirationDuration,
        isNullValuePossible: false,
        isEnabled: true,
      );

  final IUnifediApiInstancePollLimits? pollLimits;

  int? get pollMaximumOptionsCount => pollLimits?.maxOptions;

  int? get pollMaximumOptionLength => pollLimits?.maxOptionChars;

  Duration? get pollMinimumExpiration => pollLimits?.minExpirationDuration;

  Duration? get pollMaximumExpiration => pollLimits?.maxExpirationDuration;

  PostStatusPollBloc({
    required this.pollLimits,
  })  : pollOptionsGroupBloc = OneTypeFormGroupBloc<IStringValueFormFieldBloc>(
          originalItems: createDefaultPollOptions(pollLimits?.maxOptionChars),
          // ignore: no-magic-number
          minimumFieldsCount: 2,
          maximumFieldsCount: pollLimits?.maxOptions,
          newEmptyFieldCreator: () =>
              createPollOptionBloc(pollLimits?.maxOptionChars),
        ),
        durationDateTimeLengthFieldBloc =
            createDurationDateTimeLengthBloc(pollLimits),
        super(isAllItemsInitialized: true) {
    addDisposable(durationDateTimeLengthFieldBloc);
    addDisposable(multiplyFieldBloc);
    addDisposable(hideTotalsFieldBloc);
    addDisposable(pollOptionsGroupBloc);
  }

  @override
  List<IFormItemBloc> get currentItems => [
        durationDateTimeLengthFieldBloc,
        multiplyFieldBloc,
        hideTotalsFieldBloc,
        pollOptionsGroupBloc,
      ];

  @override
  // ignore: avoid-late-keyword
  late DurationDateTimeValueFormFieldBloc durationDateTimeLengthFieldBloc;
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> multiplyFieldBloc =
      BoolValueFormFieldBloc(originValue: false);
  @override
  // ignore: avoid-late-keyword
  late IBoolValueFormFieldBloc<bool> hideTotalsFieldBloc =
      BoolValueFormFieldBloc(originValue: false);

  @override
  final IOneTypeFormGroupBloc<IStringValueFormFieldBloc> pollOptionsGroupBloc;

  static List<IStringValueFormFieldBloc> createDefaultPollOptions(
    int? maximumOptionLength,
  ) =>
      <IStringValueFormFieldBloc>[
        createPollOptionBloc(maximumOptionLength),
        createPollOptionBloc(maximumOptionLength),
      ];

  static StringValueFormFieldBloc createPollOptionBloc(
    int? maximumOptionLength,
  ) =>
      createPollOptionFieldBloc('', maximumOptionLength);

  static StringValueFormFieldBloc createPollOptionFieldBloc(
    String originValue,
    int? maximumOptionLength,
  ) =>
      StringValueFormFieldBloc(
        originValue: originValue,
        validators: [
          StringValueFormFieldNonEmptyValidationError.createValidator(),
        ],
        maxLength: maximumOptionLength,
      );

  @override
  void fillFormData(IPostStatusPoll poll) {
    hideTotalsFieldBloc.changeCurrentValue(poll.hideTotals);
    multiplyFieldBloc.changeCurrentValue(poll.multiple);

    durationDateTimeLengthFieldBloc
        .changeCurrentValueDuration(poll.durationLength);
    if (poll.options.isNotEmpty) {
      pollOptionsGroupBloc.removeAllFields();

      poll.options.forEach(
        (pollOption) {
          pollOptionsGroupBloc.addNewField(
            createPollOptionFieldBloc(
              pollOption,
              pollMaximumOptionLength,
            ),
          );
        },
      );
    }
  }

  @override
  void clear() {
    // super.clear();

    pollOptionsGroupBloc.changeFields(
      createDefaultPollOptions(pollLimits?.maxOptionChars),
    );

    multiplyFieldBloc.clear();
    durationDateTimeLengthFieldBloc.clear();
    hideTotalsFieldBloc.clear();
  }
}
