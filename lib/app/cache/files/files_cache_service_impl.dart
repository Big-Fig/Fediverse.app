import 'package:cached_network_image/cached_network_image.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FilesCacheService extends DisposableOwner implements IFilesCacheService {
  final String key;

  final CacheManager cacheManager;
  final Duration stalePeriod;
  final int maxNrOfCacheObjects;

  FilesCacheService({
    @required this.key,
    @required this.stalePeriod,
    @required this.maxNrOfCacheObjects,
  }) : cacheManager = CacheManager(
          Config(
            key,
            stalePeriod: stalePeriod,
            maxNrOfCacheObjects: maxNrOfCacheObjects,
          ),
        ) {
    addDisposable(custom: () {
      cacheManager.dispose();
    });
  }

  @override
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
  }) =>
      CachedNetworkImage(
        key: key,
        imageUrl: imageUrl,
        httpHeaders: httpHeaders,
        imageBuilder: imageBuilder,
        placeholder: placeholder,
        progressIndicatorBuilder: progressIndicatorBuilder,
        errorWidget: errorWidget,
        fadeOutDuration: fadeOutDuration,
        fadeOutCurve: fadeOutCurve,
        fadeInDuration: fadeInDuration,
        fadeInCurve: fadeInCurve,
        width: width,
        height: height,
        alignment: alignment,
        repeat: repeat,
        matchTextDirection: matchTextDirection,
        cacheManager: cacheManager,
        useOldImageOnUrlChange: useOldImageOnUrlChange,
        color: color,
        filterQuality: filterQuality,
        colorBlendMode: colorBlendMode,
        placeholderFadeInDuration: placeholderFadeInDuration,
        memCacheWidth: memCacheWidth,
        memCacheHeight: memCacheHeight,
        maxWidthDiskCache: maxWidthDiskCache,
        maxHeightDiskCache: maxHeightDiskCache,
        imageRenderMethodForWeb: imageRenderMethodForWeb,
      );

  @override
  Future clear() => cacheManager.emptyCache();
}
