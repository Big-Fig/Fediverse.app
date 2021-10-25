import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi_app/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi_app/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/form_bloc.dart';
import 'package:fedi_app/form/group/one_type/one_type_form_group_bloc.dart';
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
