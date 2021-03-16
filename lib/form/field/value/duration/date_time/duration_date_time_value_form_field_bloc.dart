import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_model.dart';
import 'package:fedi/form/field/value/value_form_field_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IDurationDateTimeValueFormFieldBloc
    extends IValueFormFieldBloc<DurationDateTime?> {
  static IDurationDateTimeValueFormFieldBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IDurationDateTimeValueFormFieldBloc>(
        context,
        listen: listen,
      );

  Duration? get maxDuration;

  Duration get minDuration;

  Duration? get currentValueDuration;

  Stream<Duration?> get currentValueDurationStream;

  void changeCurrentValueDuration(Duration? newValue);

  void deleteValue();
}
