import 'package:fedi/app/web_sockets/handling_type/form/web_sockets_handling_type_single_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc.dart';
import 'package:fedi/form/field/value/select_from_list/single/single_select_from_list_value_form_field_bloc_proxy_provider.dart';
import 'package:fediverse_api/fediverse_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WebSocketsModeSingleFromListValueFormFieldBlocProxyProvider
    extends StatelessWidget {
  final Widget child;

  const WebSocketsModeSingleFromListValueFormFieldBlocProxyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ProxyProvider<
          IWebSocketsModeSingleFromListValueFormFieldBloc,
          ISingleSelectFromListValueFormFieldBloc<WebSocketsMode>>(
        update: (context, value, previous) => value,
        child:
            SingleSelectFromListValueFormFieldBlocProxyProvider<WebSocketsMode>(
          child: child,
        ),
      );
}
