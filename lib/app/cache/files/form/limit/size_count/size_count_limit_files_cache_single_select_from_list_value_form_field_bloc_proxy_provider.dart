import 'package:fedi/app/cache/files/cache/limit/size_count/files_cache_size_count_limit_model.dart';
import 'package:fedi/app/cache/files/form/limit/size_count/size_count_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  SizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ISizeCountLimitFilesCacheSingleSelectFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<
              FilesCacheSizeLimitCountType?>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            FilesCacheSizeLimitCountType>(
          child: child,
        ),
      );
}
