import 'package:fedi_app/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IUnifediChatShareBloc extends IShareToAccountBloc {
  static IUnifediChatShareBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IUnifediChatShareBloc>(context, listen: listen);
}
