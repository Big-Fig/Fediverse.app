import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/pleroma/instance/pleroma_instance_model.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/date_time/form_date_time_field_bloc.dart';
import 'package:fedi/ui/form/field/value/date_time/form_date_time_field_bloc_impl.dart';
import 'package:fedi/ui/form/field/value/string/form_non_empty_string_field_validation.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc_impl.dart';
import 'package:fedi/ui/form/form_bloc_impl.dart';
import 'package:fedi/ui/form/form_item_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc_impl.dart';
import 'package:flutter/cupertino.dart';

class PostStatusPollBloc extends FormBloc implements IPostStatusPollBloc {
  static FormDateTimeFieldBloc createExpiresAtBloc(
      PleromaInstancePollLimits pollLimits) {
    Duration pollMinimumExpiration = pollLimits?.minExpiration != null
        ? Duration(seconds: pollLimits?.minExpiration)
        : IPostStatusPollBloc.minimumPollExpiration;

    Duration pollMaximumExpiration = pollLimits?.maxExpiration != null
        ? Duration(seconds: pollLimits?.maxExpiration)
        : null;

    var now = DateTime.now();
    var minDateTime = now.add(pollMinimumExpiration);
    DateTime maxDateTime;
    if(pollMaximumExpiration != null) {
      maxDateTime = now.add(pollMaximumExpiration);
    }
    var originValue = now.add(IPostStatusPollBloc.defaultPollExpiration);

    if (originValue.isBefore(minDateTime)) {
      originValue = minDateTime;
    }

    return FormDateTimeFieldBloc(
      originValue: originValue,
      minDateTime: minDateTime,
      maxDateTime: maxDateTime,
    );
  }

  final PleromaInstancePollLimits pollLimits;

  int get pollMaximumOptionsCount =>
      pollLimits?.maxOptions ?? IPostStatusPollBloc.maxPollOptions;

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
        expiresAtFieldBloc = createExpiresAtBloc(pollLimits);

  @override
  List<IFormItemBloc> get items => [
        expiresAtFieldBloc,
        multiplyFieldBloc,
        pollOptionsGroupBloc,
      ];

  @override
  IFormDateTimeFieldBloc expiresAtFieldBloc;
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
        validators: [NonEmptyStringFieldValidationError.createValidator()],
        maxLength: maximumOptionLength);
  }

  @override
  void clear() {
    pollOptionsGroupBloc.clear();
    expiresAtFieldBloc.clear();
    multiplyFieldBloc.clear();
  }

  @override
  void fillFormData(IPostStatusPoll poll) {
    multiplyFieldBloc.changeCurrentValue(poll.multiple);
    expiresAtFieldBloc.changeCurrentValue(poll.expiresAt);
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
