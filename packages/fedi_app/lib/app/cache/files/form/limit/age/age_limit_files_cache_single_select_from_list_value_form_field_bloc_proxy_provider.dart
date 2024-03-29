import 'package:fedi_app/app/cache/files/form/limit/age/age_limit_files_cache_single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/app/cache/files/limit/age/files_cache_age_limit_model.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi_app/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AgeLimitFilesSelectCacheSingleSelectValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const AgeLimitFilesSelectCacheSingleSelectValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IAgeLimitFilesSelectCacheSingleSelectValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<FilesCacheAgeLimitType>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            FilesCacheAgeLimitType>(
          child: child,
        ),
      );
}
