import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_dispose/easy_dispose.dart';
import 'package:fedi/app/cache/files/files_cache_service.dart';
import 'package:fedi/connection/connection_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FilesCacheService extends DisposableOwner implements IFilesCacheService {
  final String key;

  final IConnectionService connectionService;
  final CacheManager cacheManager;

  FilesCacheService({
    required this.key,
    required this.connectionService,
    required Duration? stalePeriod,
    required int? maxNrOfCacheObjects,
  }) : cacheManager = CacheManager(
          Config(
            key,
            // ignore: no-magic-number
            stalePeriod: stalePeriod ?? Duration(days: 30),
            // ignore: no-magic-number
            maxNrOfCacheObjects: maxNrOfCacheObjects ?? 100,
          ),
        ) {
    addCustomDisposable(() => cacheManager.dispose());
  }

  @override
  // todo: refactor long-parameter-list
  // ignore: long-parameter-list
  Widget createCachedNetworkImageWidget({
    String? stringKey,
    required String? imageUrl,
    Map<String, String>? httpHeaders,
    ImageWidgetBuilder? imageBuilder,
    PlaceholderWidgetBuilder? placeholder,
    ProgressIndicatorBuilder? progressIndicatorBuilder,
    LoadingErrorWidgetBuilder? errorWidget,
    Duration fadeOutDuration = const Duration(milliseconds: 1000),
    Cubic fadeOutCurve = Curves.easeOut,
    Duration fadeInDuration = const Duration(milliseconds: 500),
    Cubic fadeInCurve = Curves.easeIn,
    double? width,
    double? height,
    BoxFit? fit,
    Alignment alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    bool matchTextDirection = false,
    bool useOldImageOnUrlChange = false,
    Color? color,
    FilterQuality filterQuality = FilterQuality.low,
    BlendMode? colorBlendMode,
    Duration? placeholderFadeInDuration,
    int? memCacheWidth,
    int? memCacheHeight,
    String? cacheKey,
    int? maxWidthDiskCache,
    int? maxHeightDiskCache,
  }) {
    assert(imageUrl?.isNotEmpty == true);

    var actualImageUrl = imageUrl;
    // todo: apply only for mock launch type
    if (Platform.isAndroid) {
      actualImageUrl = actualImageUrl!.replaceAll('localhost', '10.0.2.2');
      actualImageUrl = actualImageUrl.replaceAll(
        'https://ops.pleroma.social',
        'http://10.0.2.2:4000',
      );
    } else if (Platform.isIOS) {
      actualImageUrl = actualImageUrl!.replaceAll('10.0.2.2', 'localhost');
      actualImageUrl = actualImageUrl.replaceAll(
        'https://ops.pleroma.social',
        'http://localhost:4000',
      );
    }

    stringKey ??= actualImageUrl;

    return StreamBuilder<bool>(
      stream: connectionService.isConnectedStream.distinct(),
      builder: (context, snapshot) {
        var isConnected = snapshot.data ?? true;

        return CachedNetworkImage(
          key: ValueKey(stringKey! + '+' + isConnected.toString()),
          imageUrl: actualImageUrl!,
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
          fit: fit,
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
        );
      },
    );
  }

  @override
  Future clear() => cacheManager.emptyCache();

  @override
  Future<File> getImageByUrl({
    required String imageUrl,
  }) =>
      cacheManager.getSingleFile(imageUrl);
}
