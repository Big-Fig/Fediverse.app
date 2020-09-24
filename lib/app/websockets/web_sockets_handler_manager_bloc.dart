import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IWebSocketsHandlerManagerBloc implements Disposable {
  static IWebSocketsHandlerManagerBloc of(BuildContext context,
          {bool listen = true}) =>
      Provider.of<IWebSocketsHandlerManagerBloc>(context, listen: listen);

  Disposable listenMyAccountChannel({
    @required bool notification,
    @required bool chat,
  });

  Disposable listenAccountChannel({
    @required String accountId,
    @required bool notification,
  });

  Disposable listenDirectChannel();

  Disposable listenPublicChannel({
    @required bool local,
    @required bool onlyMedia,
  });

  Disposable listenHashtagChannel({
    @required String hashtag,
    @required bool local,
  });

  Disposable listenListChannel({
    @required String listId,
  });
}
