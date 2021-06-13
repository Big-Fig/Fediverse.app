import 'package:fedi/app/auth/instance/join/join_auth_instance_bloc.dart';
import 'package:fedi/app/config/config_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:flutter/cupertino.dart';

class JoinAuthInstanceBloc extends DisposableOwner
    implements IJoinAuthInstanceBloc {
  @override
  final bool isFromScratch;
  @override
  final TextEditingController hostTextController = TextEditingController();

  final IConfigService configService;

  JoinAuthInstanceBloc({
    required this.isFromScratch,
    required this.configService,
  }) {
    addDisposable(textEditingController: hostTextController);
  }

  @override
  Uri extractCurrentUri() {
    var uriText = hostTextController.text;

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
      child: child,
    );
  }
}
