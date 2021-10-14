import 'package:fedi/app/pagination/page_size/form/pagination_page_size_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/app/pagination/page_size/pagination_page_size_model.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PaginationPageSizeSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const PaginationPageSizeSingleFromListValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IPaginationPageSizeSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<PaginationPageSize?>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            PaginationPageSize?>(
          child: child,
        ),
      );
}
