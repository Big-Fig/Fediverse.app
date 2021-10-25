import 'package:fedi_app/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';

abstract class IPaginationPageSizeSingleFromListValueFormFieldBloc
    implements ISingleSelectFromListValueFormFieldBloc<PaginationPageSize> {
  static const PaginationPageSize defaultValue =
      IPaginationSettingsBloc.defaultPageSizeValue;
}
