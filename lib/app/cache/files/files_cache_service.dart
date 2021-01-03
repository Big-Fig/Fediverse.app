import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

abstract class IFilesCacheService implements IDisposable {
  static IFilesCacheService of(BuildContext context, {bool listen = true}) =>
      Provider.of<IFilesCacheService>(context, listen: listen);

  Future clear();

  Widget createCachedNetworkImageWidget({
    Key key,
    @required String imageUrl,
    Map<String, String> httpHeaders,
    ImageWidgetBuilder imageBuilder,
    PlaceholderWidgetBuilder placeholder,
    ProgressIndicatorBuilder progressIndicatorBuilder,
    LoadingErrorWidgetBuilder errorWidget,
    Duration fadeOutDuration = const Duration(milliseconds: 1000),
    Cubic fadeOutCurve = Curves.easeOut,
    Duration fadeInDuration = const Duration(milliseconds: 500),
    Cubic fadeInCurve = Curves.easeIn,
    double width,
    double height,
    BoxFit fit,
    Alignment alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    bool matchTextDirection = false,
    bool useOldImageOnUrlChange = false,
    Color color,
    FilterQuality filterQuality = FilterQuality.low,
    BlendMode colorBlendMode,
    Duration placeholderFadeInDuration,
    int memCacheWidth,
    int memCacheHeight,
    String cacheKey,
    int maxWidthDiskCache,
    int maxHeightDiskCache,
    ImageRenderMethodForWeb imageRenderMethodForWeb,
  });
}
