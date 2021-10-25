import 'package:fedi_app/form/field/value/string/string_value_form_field_bloc.dart';
import 'package:fedi_app/form/group/pair/key_value_pair_form_group_bloc.dart';

abstract class ILinkPairFormGroupBloc extends IKeyValuePairFormGroupBloc<
    IStringValueFormFieldBloc, IStringValueFormFieldBloc> {}
