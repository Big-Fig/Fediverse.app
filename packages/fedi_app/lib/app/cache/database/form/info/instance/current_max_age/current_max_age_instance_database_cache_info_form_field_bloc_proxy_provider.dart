import 'package:fedi_app/app/cache/database/form/info/instance/current_max_age/current_max_age_instance_database_cache_info_form_field_bloc.dart';
import 'package:fedi_app/form/field/info/info_form_field_bloc.dart';
import 'package:fedi_app/form/field/info/info_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const CurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          ICurrentMaxAgeInstanceDatabaseCacheInfoFormFieldBloc,
          IInfoFormFieldBloc<DateTime?>>(
        update: (context, value, previous) => value,
        child: InfoFormFieldBlocProxyProvider<DateTime?>(
          child: child,
        ),
      );
}
