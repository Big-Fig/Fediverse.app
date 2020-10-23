import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IWebSocketsHandlerManagerBloc implements IDisposable {
  static IWebSocketsHandlerManagerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IWebSocketsHandlerManagerBloc>(context, listen: listen);

  IDisposable listenMyAccountChannel({
    @required bool notification,
    @required bool chat,
  });

  IDisposable listenAccountChannel({
    @required String accountId,
    @required bool notification,
  });

  IDisposable listenDirectChannel();

  IDisposable listenPublicChannel({
    @required bool local,
    @required bool onlyMedia,
  });

  IDisposable listenHashtagChannel({
    @required String hashtag,
    @required bool local,
  });

  IDisposable listenListChannel({
    @required String listId,
  });
}
