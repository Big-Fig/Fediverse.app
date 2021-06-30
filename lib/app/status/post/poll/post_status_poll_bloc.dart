import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:fedi/form/group/one_type/one_type_form_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusPollBloc implements IFormBloc, IDisposable {
  static IPostStatusPollBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IPostStatusPollBloc>(
        context,
        listen: listen,
      );

  IOneTypeFormGroupBloc<IStringValueFormFieldBloc> get pollOptionsGroupBloc;

  IBoolValueFormFieldBloc<bool> get multiplyFieldBloc;
  IBoolValueFormFieldBloc<bool> get hideTotalsFieldBloc;

  IDurationDateTimeValueFormFieldBloc get durationDateTimeLengthFieldBloc;

  void fillFormData(IPostStatusPoll poll);
}
