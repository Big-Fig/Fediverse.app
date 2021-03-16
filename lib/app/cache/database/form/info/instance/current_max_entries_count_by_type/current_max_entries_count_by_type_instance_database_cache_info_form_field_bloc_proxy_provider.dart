import 'package:fedi/app/cache/database/form/info/instance/current_max_entries_count_by_type/current_max_entries_count_by_type_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi/form/field/info/info_form_field_bloc.dart';
import 'package:fedi/form/field/info/info_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  CurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ICurrentMaxEntriesCountByTypeInstanceDatabaseCacheInfoFormFieldBloc,
          IInfoFormFieldBloc<int?>>(
        update: (context, value, previous) => value,
        child: InfoFormFieldBlocProxyProvider<int>(
          child: child,
        ),
      );
}
