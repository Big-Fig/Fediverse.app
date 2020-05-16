import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/refactored/app/account/my/my_account_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class FediHeaderImageDecorationWidget extends StatelessWidget {
  final Widget child;

  FediHeaderImageDecorationWidget({@required this.child});

  @override
  Widget build(BuildContext context) {

    var myAccountBloc = IMyAccountBloc.of(context, listen: false);
    return StreamBuilder<String>(
        stream: myAccountBloc.headerStream,
        initialData: myAccountBloc.header,
        builder: (context, snapshot) {
          var header = snapshot.data;

          if (header != null) {
            // todo: think about unnecessary redraw performance
            return CachedNetworkImage(
              imageUrl: header,
              errorWidget: (BuildContext context, String url, Object error) =>
                  buildDefaultHeader(child),
              placeholder: (BuildContext context, String url) =>
                  buildDefaultHeader(child),
              imageBuilder:
                  (BuildContext context, ImageProvider imageProvider) =>
                      buildWithImageProvider(imageProvider, child),
            );
          } else {
            return buildDefaultHeader(child);
          }
        });
  }

  Container buildDefaultHeader(SafeArea child) {
    var imageProvider = getDefaultHeaderImage().image;
    return buildWithImageProvider(imageProvider, child);
  }

  Container buildWithImageProvider(
      ImageProvider imageProvider, SafeArea child) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: imageProvider)),
        child: child);
  }

  Image getDefaultHeaderImage() =>
      Image.asset("assets/images/default_timeline_header.png");
}
