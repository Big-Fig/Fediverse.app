import 'package:fedi/app/filter/context/filter_context_multi_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/bool/bool_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/duration/date_time/duration_date_time_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi/form/form_bloc.dart';
import 'package:unifedi_api/unifedi_api.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilterFormBloc extends IFormBloc {
  static IFilterFormBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFilterFormBloc>(context, listen: listen);

  IStringValueFormFieldBloc get phraseField;

  IBoolValueFormFieldBloc get irreversibleField;

  IBoolValueFormFieldBloc get wholeWordField;

  IDurationDateTimeValueFormFieldBloc get expiresInField;

  IFilterContextMultiSelectFromListValueFormFieldBloc get contextField;

  IPostUnifediApiFilter calculateFormValue();
}
