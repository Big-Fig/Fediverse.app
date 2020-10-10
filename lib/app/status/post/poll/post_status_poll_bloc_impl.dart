import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/duration/form_duration_field_bloc.dart';
import 'package:fedi/ui/form/field/value/duration/form_duration_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc_impl.dart';
import 'package:flutter/cupertino.dart';

class PostStatusPollBloc extends FormBloc implements IPostStatusPollBloc {
  static FormDurationFieldBloc createDurationLengthBloc(
      PleromaInstancePollLimits pollLimits) {
    Duration pollMinimumExpiration = pollLimits?.minExpiration != null
        ? Duration(seconds: pollLimits?.minExpiration)
        : IPostStatusPollBloc.minimumPollExpiration;

    Duration pollMaximumExpiration = pollLimits?.maxExpiration != null
        ? Duration(seconds: pollLimits?.maxExpiration)
        : null;


    var originValue = IPostStatusPollBloc.defaultPollExpiration;
    return FormDurationFieldBloc(
      originValue: originValue,
      minDuration: pollMinimumExpiration,
      maxDuration: pollMaximumExpiration,
    );
  }

  final PleromaInstancePollLimits pollLimits;

  int get pollMaximumOptionsCount =>
      pollLimits?.maxOptions ?? IPostStatusPollBloc.defaultMaxPollOptions;

  int get pollMaximumOptionLength => pollLimits?.maxOptionChars;

  Duration get pollMinimumExpiration => pollLimits?.minExpiration != null
      ? Duration(seconds: pollLimits?.minExpiration)
      : IPostStatusPollBloc.minimumPollExpiration;

  Duration get pollMaximumExpiration => pollLimits?.maxExpiration != null
      ? Duration(seconds: pollLimits?.maxExpiration)
      : null;

  PostStatusPollBloc({
    @required this.pollLimits,
  })  : pollOptionsGroupBloc = FormOneTypeGroupBloc<IFormStringFieldBloc>(
          originalItems: createDefaultPollOptions(pollLimits?.maxOptionChars),
          minimumFieldsCount: 2,
          maximumFieldsCount: pollLimits?.maxOptions ?? 20,
          newEmptyFieldCreator: () =>
              createPollOptionBloc(pollLimits?.maxOptionChars),
        ),
        durationLengthFieldBloc = createDurationLengthBloc(pollLimits);

  @override
  List<IFormItemBloc> get items => [
        durationLengthFieldBloc,
        multiplyFieldBloc,
        pollOptionsGroupBloc,
      ];

  @override
  IFormDurationFieldBloc durationLengthFieldBloc;
  @override
  IFormBoolFieldBloc multiplyFieldBloc = FormBoolFieldBloc(originValue: false);

  @override
  IFormOneTypeGroupBloc<IFormStringFieldBloc> pollOptionsGroupBloc;

  static List<IFormStringFieldBloc> createDefaultPollOptions(
      int maximumOptionLength) {
    return <IFormStringFieldBloc>[
      createPollOptionBloc(maximumOptionLength),
      createPollOptionBloc(maximumOptionLength),
    ];
  }

  static FormStringFieldBloc createPollOptionBloc(int maximumOptionLength) =>
      createPollOptionFieldBloc(null, maximumOptionLength);

  static FormStringFieldBloc createPollOptionFieldBloc(
    String originValue,
    int maximumOptionLength,
  ) {
    return FormStringFieldBloc(
        originValue: originValue,
        validators: [
          FormNonEmptyStringFieldValidationError.createValidator(),
        ],
        maxLength: maximumOptionLength);
  }

  @override
  void fillFormData(IPostStatusPoll poll) {
    multiplyFieldBloc.changeCurrentValue(poll.multiple);

    durationLengthFieldBloc.changeCurrentValue(poll.durationLength);
    if (poll.options?.isNotEmpty == true) {
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
}
