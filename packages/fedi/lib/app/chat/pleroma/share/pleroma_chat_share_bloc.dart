import 'package:fedi/app/share/to_account/share_to_account_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IPleromaChatShareBloc extends IShareToAccountBloc {
  static IPleromaChatShareBloc of(BuildContext context, {bool listen = true}) =>
      Provider.of<IPleromaChatShareBloc>(context, listen: listen);
}
