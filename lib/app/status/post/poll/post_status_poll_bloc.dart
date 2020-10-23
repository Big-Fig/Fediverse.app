import 'package:fedi/app/status/post/poll/post_status_poll_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/ui/form/field/value/bool/form_bool_field_bloc.dart';
import 'package:fedi/ui/form/field/value/duration/form_duration_field_bloc.dart';
import 'package:fedi/ui/form/field/value/string/form_string_field_bloc.dart';
import 'package:fedi/ui/form/form_bloc.dart';
import 'package:fedi/ui/form/group/one_type/form_one_type_group_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPostStatusPollBloc implements IFormBloc, IDisposable {
  static IPostStatusPollBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPostStatusPollBloc>(context, listen: listen);

  static final Duration minimumPollExpiration = Duration(minutes: 10);
  static final Duration defaultPollExpiration = Duration(days: 1);
  static final int defaultMaxPollOptions = 20;

  IFormOneTypeGroupBloc<IFormStringFieldBloc> get pollOptionsGroupBloc;

  IFormBoolFieldBloc get multiplyFieldBloc;

  IFormDurationFieldBloc get durationLengthFieldBloc;

  void fillFormData(IPostStatusPoll poll);


}
