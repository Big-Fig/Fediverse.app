import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi_app/app/access/join/join_access_bloc.dart';
import 'package:fedi_app/app/access/join/join_access_bloc_proxy_provider.dart';
import 'package:fedi_app/app/config/config_service.dart';
import 'package:fedi_app/app/server_list/server_list_auto_complete_bloc.dart';
import 'package:fedi_app/app/server_list/server_list_auto_complete_bloc_impl.dart';
import 'package:flutter/cupertino.dart';

class JoinAccessBloc extends DisposableOwner implements IJoinAccessBloc {
  @override
  final bool isFromScratch;
  @override
  final TextEditingController hostTextController = TextEditingController();
  @override
  final FocusNode hostFocusNode = FocusNode();

  @override
  final IServerListAutoCompleteBloc serverListAutoCompleteBloc =
      ServerListAutoCompleteBloc();

  final IConfigService configService;

  JoinAccessBloc({
    required this.isFromScratch,
    required this.configService,
  }) {
    hostTextController.disposeWith(this);
    hostFocusNode.disposeWith(this);

    // don't need to await we start init but don't need wait to finish
    serverListAutoCompleteBloc
      ..performAsyncInit()
      ..disposeWith(this);
  }

  @override
  Uri extractCurrentUri() {
    var uriText = hostTextController.text.trim();

    if (!uriText.isNotEmpty) {
      uriText = configService.appDefaultInstanceUrl;
    }

    var parsedUri = Uri.parse(uriText);

    Uri uri;
    var scheme = parsedUri.scheme;
    if (!scheme.isNotEmpty) {
      uri = Uri.parse('https://$uriText');
    } else {
      uri = parsedUri;
    }

    return uri;
  }

  static JoinAccessBloc createFromContext(
    BuildContext context, {
    required bool isFromScratch,
  }) =>
      JoinAccessBloc(
        configService: IConfigService.of(
          context,
          listen: false,
        ),
        isFromScratch: isFromScratch,
      );

  static Widget provideToContext(
    BuildContext context, {
    required Widget child,
    required bool isFromScratch,
  }) =>
      DisposableProvider<IJoinAccessBloc>(
        create: (context) => JoinAccessBloc.createFromContext(
          context,
          isFromScratch: isFromScratch,
        ),
        child: JoinAccessBlocProxyProvider(
          child: child,
        ),
      );
}
