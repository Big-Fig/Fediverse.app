import 'package:fedi/app/cache/database/cache/limit/entries_count/database_cache_entries_count_limit_model.dart';
import 'package:fedi/app/cache/database/form/limit/entries_count_by_type/entries_count_by_type_limit_database_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class EntriesCountByTypeLimitDatabaseCacheSingleSelectValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  EntriesCountByTypeLimitDatabaseCacheSingleSelectValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IEntriesCountByTypeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<
              DatabaseCacheEntriesCountByTypeLimitType?>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            DatabaseCacheEntriesCountByTypeLimitType?>(
          child: child,
        ),
      );
}
