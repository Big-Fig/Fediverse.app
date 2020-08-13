import 'package:fedi/app/status/post/poll/post_status_poll_bloc.dart';
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

class PostStatusPollBloc extends FormBloc implements IPostStatusPollBloc {
  @override
  List<IFormItemBloc> get items => [
        expiresAtFieldBloc,
        multiplyFieldBloc,
        pollOptionsGroupBloc,
      ];

  @override
  IFormDateTimeFieldBloc expiresAtFieldBloc = FormDateTimeFieldBloc(
    originValue: DateTime.now().add(IPostStatusPollBloc.requiredMinimumDuration),
    minDate: DateTime.now().add(IPostStatusPollBloc.requiredMinimumDuration),
    maxDate: null,
  );

  @override
  IFormBoolFieldBloc multiplyFieldBloc = FormBoolFieldBloc(originValue: false);

  @override
  IFormOneTypeGroupBloc<IFormStringFieldBloc> pollOptionsGroupBloc =
      FormOneTypeGroupBloc<IFormStringFieldBloc>(
          originalItems: <IFormStringFieldBloc>[
        createPollOptionBloc(),
        createPollOptionBloc(),
      ],
          maximumFieldsCount: 10,
          newFieldCreator: () => createPollOptionBloc());

  static FormStringFieldBloc createPollOptionBloc() => FormStringFieldBloc(
      originValue: null,
      validators: [NonEmptyStringFieldValidationError.createValidator()]);
}
