import 'package:fedi/form/group/pair/form_key_value_pair_field_group_bloc.dart';
import 'package:fedi/form/field/value/string/form_string_field_bloc.dart';

abstract class IFormLinkPairFieldGroupBloc
    extends IFormKeyValuePairFieldGroupBloc<IFormStringFieldBloc,
        IFormStringFieldBloc> {}