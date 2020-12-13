import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/filter/filter_model.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/date_time/date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilterFormBloc extends IFormBloc {
  static IFilterFormBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFilterFormBloc>(context, listen: listen);

  IStringValueFormFieldBloc get phraseField;

  IBoolValueFormFieldBloc get irreversibleField;

  IBoolValueFormFieldBloc get wholeWordField;

  IDateTimeValueFormFieldBloc get expiresAtField;

  IFilterContextMultiSelectFromListValueFormFieldBloc get contextField;

  IFilter calculateFormValue();
}
