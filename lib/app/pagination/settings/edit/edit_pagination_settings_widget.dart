import 'package:fedi/app/pagination/page_size/form/pagination_page_size_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/pagination/page_size/form/pagination_page_size_single_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/pagination/settings/edit/edit_pagination_settings_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EditPaginationSettingsWidget extends StatelessWidget {
  final bool shrinkWrap;

  const EditPaginationSettingsWidget({
    required this.shrinkWrap,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: shrinkWrap ? MainAxisSize.min : MainAxisSize.max,
        children: [
          const _EditPaginationSettingsPageSizeFieldWidget(),
        ],
      );
}

class _EditPaginationSettingsPageSizeFieldWidget extends StatelessWidget {
  const _EditPaginationSettingsPageSizeFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEditPaginationSettingsBloc,
          IPaginationPageSizeSingleFromListValueFormFieldBloc>(
        update: (context, value, previous) => value.pageSizeFieldBloc,
        child: const PaginationPageSizeSingleFromListValueFormFieldRowWidget(),
      );
}
