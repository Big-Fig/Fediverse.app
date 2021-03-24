import 'package:fedi/app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_row_widget.dart';
import 'package:fedi/app/pagination/page_size/form/pagination_page_size_single_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/generated/l10n.dart';
import 'package:flutter/cupertino.dart';

class PaginationPageSizeSingleFromListValueFormFieldRowWidget
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      PaginationPageSizeSingleFromListValueFormFieldBlocProxyProvider(
        child: SingleSelectFromListValueFormFieldRowWidget<PaginationPageSize?>(
          label: S.of(context).app_pagination_settings_pageSize_label,
          valueTitleMapper: (context, value) =>
              mapPaginationPageSizeToLabel(context, value!),
          description: null,
          descriptionOnDisabled: null,
          displayIconInRow: false,
          displayIconInDialog: false,
          valueIconMapper: null,
        ),
      );

  const PaginationPageSizeSingleFromListValueFormFieldRowWidget();
}

String mapPaginationPageSizeToLabel(
  BuildContext context,
  PaginationPageSize type,
) {
  switch (type) {
    case PaginationPageSize.size5:
      return "5";
    case PaginationPageSize.size10:
      return "10";
    case PaginationPageSize.size20:
      return "20";
    case PaginationPageSize.size50:
      return "50";
    case PaginationPageSize.size100:
      return "100";
  }
}
