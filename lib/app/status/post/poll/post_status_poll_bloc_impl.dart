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
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';

class PostStatusPollBloc extends FormBloc implements IPostStatusPollBloc {
  static DurationDateTimeValueFormFieldBloc createDurationDateTimeLengthBloc(
    PleromaInstancePollLimits pollLimit,
  ) {
    Duration pollMinimumExpiration = pollLimit.minExpirationDurationOrDefault;

    Duration pollMaximumExpiration = pollLimit.maxExpirationDurationOrDefault;

    return DurationDateTimeValueFormFieldBloc(
      originValue: DurationDateTime(
        duration: PleromaInstancePollLimits.defaultPollExpiration,
        dateTime: null,
      ),
      minDuration: pollMinimumExpiration,
      maxDuration: pollMaximumExpiration,
      isNullValuePossible: false,
      isEnabled: true,
    );
  }

  final PleromaInstancePollLimits pollLimits;

  int get pollMaximumOptionsCount => pollLimits.maxOptionsOrDefault;

  int? get pollMaximumOptionLength => pollLimits.maxOptionCharsOrDefault;

  Duration get pollMinimumExpiration =>
      pollLimits.minExpirationDurationOrDefault;

  Duration get pollMaximumExpiration =>
      pollLimits.maxExpirationDurationOrDefault;

  PostStatusPollBloc({
    required this.pollLimits,
  })   : pollOptionsGroupBloc = OneTypeFormGroupBloc<IStringValueFormFieldBloc>(
          originalItems:
              createDefaultPollOptions(pollLimits.maxOptionCharsOrDefault),
          minimumFieldsCount: 2,
          maximumFieldsCount: pollLimits.maxOptionsOrDefault,
          newEmptyFieldCreator: () =>
              createPollOptionBloc(pollLimits.maxOptionCharsOrDefault),
        ),
        durationDateTimeLengthFieldBloc =
            createDurationDateTimeLengthBloc(pollLimits),
        super(isAllItemsInitialized: true);

  @override
  List<IFormItemBloc> get currentItems => [
        durationDateTimeLengthFieldBloc,
        multiplyFieldBloc,
        pollOptionsGroupBloc,
      ];

  @override
  late DurationDateTimeValueFormFieldBloc durationDateTimeLengthFieldBloc;
  @override
  late IBoolValueFormFieldBloc multiplyFieldBloc =
      BoolValueFormFieldBloc(originValue: false);

  @override
  final IOneTypeFormGroupBloc<IStringValueFormFieldBloc> pollOptionsGroupBloc;

  static List<IStringValueFormFieldBloc> createDefaultPollOptions(
      int? maximumOptionLength) {
    return <IStringValueFormFieldBloc>[
      createPollOptionBloc(maximumOptionLength),
      createPollOptionBloc(maximumOptionLength),
    ];
  }

  static StringValueFormFieldBloc createPollOptionBloc(
          int? maximumOptionLength) =>
      createPollOptionFieldBloc(null, maximumOptionLength);

  static StringValueFormFieldBloc createPollOptionFieldBloc(
    String? originValue,
    int? maximumOptionLength,
  ) {
    return StringValueFormFieldBloc(
      originValue: originValue,
      validators: [
        StringValueFormFieldNonEmptyValidationError.createValidator(),
      ],
      maxLength: maximumOptionLength,
    );
  }

  @override
  void fillFormData(IPostStatusPoll poll) {
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
      createDefaultPollOptions(pollLimits.maxOptionChars),
    );
  }
}
