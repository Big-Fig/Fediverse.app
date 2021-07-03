import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc_proxy_provider.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/app/server_list/server_list_auto_complete_bloc.dart';
import 'package:fedi/app/server_list/server_list_auto_complete_bloc_impl.dart';
import 'package:flutter/cupertino.dart';

class JoinAuthInstanceBloc extends DisposableOwner
    implements IJoinAuthInstanceBloc {
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

  JoinAuthInstanceBloc({
    required this.isFromScratch,
    required this.configService,
  }) {
    hostTextController.disposeWith(this);
    hostFocusNode.disposeWith(this);

    // don't need to await we start init but don't need wait to finish
    serverListAutoCompleteBloc.performAsyncInit();
    serverListAutoCompleteBloc.disposeWith(this);
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

  static JoinAuthInstanceBloc createFromContext(
    BuildContext context, {
    required bool isFromScratch,
  }) =>
      JoinAuthInstanceBloc(
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
  }) {
    return DisposableProvider<IJoinAuthInstanceBloc>(
      create: (context) => JoinAuthInstanceBloc.createFromContext(
        context,
        isFromScratch: isFromScratch,
      ),
      child: JoinAuthInstanceBlocProxyProvider(
        child: child,
      ),
    );
  }
}
