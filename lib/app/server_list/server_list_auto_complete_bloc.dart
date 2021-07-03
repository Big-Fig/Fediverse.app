import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IServerListAutoCompleteBloc
    implements IAsyncInitLoadingBloc, IDisposable {
  static IServerListAutoCompleteBloc of(
    BuildContext context, {
    bool listen = true,
  }) =>
      Provider.of<IServerListAutoCompleteBloc>(context, listen: listen);

  List<String> calculateServersSuggestionForTextInput(String textInput);

  List<String> get serversToAutoComplete;

  Stream<List<String>> get serversToAutoCompleteStream;
}
