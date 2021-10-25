import 'package:fedi_app/app/pagination/page_size/form/pagination_page_size_single_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/pagination/settings/pagination_settings_model.dart';
import 'package:fedi_app/app/settings/global_or_instance/edit/edit_global_or_instance_settings_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IEditPaginationSettingsBloc
    implements IEditGlobalOrInstanceSettingsBloc<PaginationSettings> {
  static IEditPaginationSettingsBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IEditPaginationSettingsBloc>(
        context,
        listen: listen,
      );

  IPaginationPageSizeSingleFromListValueFormFieldBloc get pageSizeFieldBloc;
}
