import 'package:fedi/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fedi/web_sockets/handling_type/web_sockets_handling_type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WebSocketsHandlingTypeSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  WebSocketsHandlingTypeSingleFromListValueFormFieldBlocProxyProvider({
    required this.child,
  });

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IWebSocketsHandlingTypeSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<WebSocketsHandlingType>>(
        update: (context, value, previous) => value,
        child: SingleSelectFromListValueFormFieldBlocProxyProvider<
            WebSocketsHandlingType>(
          child: child,
        ),
      );
}
