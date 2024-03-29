import 'package:fedi_app/app/cache/database/form/limit/age/age_limit_database_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/cache/database/limit/age/database_cache_age_limit_model.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const AgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IAgeLimitDatabaseSelectCacheSingleSelectValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<DatabaseCacheAgeLimitType>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            DatabaseCacheAgeLimitType>(
          child: child,
        ),
      );
}
