import 'package:fedi/ui/form/form_key_value_pair_field_bloc.dart';
import 'package:fedi/ui/form/form_string_field_bloc.dart';

abstract class IFormLinkPairFieldBloc
    extends IFormKeyValuePairFieldBloc<IFormStringFieldBloc,
        IFormStringFieldBloc> {}