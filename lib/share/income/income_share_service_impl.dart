import 'dart:async';

import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/share/income/income_share_model.dart';
import 'package:fedi/share/income/income_share_service.dart';
import 'package:logging/logging.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

final _logger = Logger('income_share_service_impl.dart');

class IncomeShareService extends AsyncInitLoadingBloc
    implements IIncomeShareService {
  @override
  IncomeShareEvent? lastReceivedShareEvent;

  @override
  Stream<IncomeShareEvent> get incomeShareEventStream =>
      incomeShareEventStreamController.stream;

  final StreamController<IncomeShareEvent> incomeShareEventStreamController =
      StreamController.broadcast();

  IncomeShareService() {
    addDisposable(streamController: incomeShareEventStreamController);
  }

  @override
  Future internalAsyncInit() async {
    await loadInitialEvent();

    _listenShareEvents();
  }

  Future<void> loadInitialEvent() async {
    var initialMedias = await ReceiveSharingIntent.getInitialMedia();

    var initialText = await ReceiveSharingIntent.getInitialText();

    var mappedMedias = initialMedias.isNotEmpty
        ? initialMedias.map(_mapMedia).toList()
        : null;

    if (mappedMedias?.isNotEmpty == true || initialText?.isNotEmpty == true) {
      lastReceivedShareEvent = IncomeShareEvent(
        medias: mappedMedias,
        text: initialText,
      );
    }

    _logger.finest(() => 'lastReceivedShareEvent $lastReceivedShareEvent');
  }

  void _listenShareEvents() {
    _listenShareMediaEvents();

    _listenShareTextEvents();
  }

  void _listenShareTextEvents() {
    addDisposable(
      streamSubscription: ReceiveSharingIntent.getTextStream().listen(
        (String value) {
          _logger.finest(() => 'getTextStream $value');
          lastReceivedShareEvent = IncomeShareEvent(
            medias: null,
            text: value,
          );
          incomeShareEventStreamController.add(
            lastReceivedShareEvent!,
          );
        },
        onError: (err) {
          _logger.shout(() => 'getTextStream error $err');
        },
      ),
    );
  }

  void _listenShareMediaEvents() {
    addDisposable(
      streamSubscription: ReceiveSharingIntent.getMediaStream().listen(
        (List<SharedMediaFile> value) {
          var medias = value.map(_mapMedia).toList();

          _logger.finest(
            () => 'getMediaStream ${medias.map((item) => item).join(', ')}',
          );

          if (medias.isNotEmpty) {
            incomeShareEventStreamController.add(
              IncomeShareEvent(
                medias: medias,
                text: null,
              ),
            );
          }
        },
        onError: (err) {
          _logger.shout(() => 'getMediaStream error $err');
        },
      ),
    );
  }

  @override
  Future reset() async {
    lastReceivedShareEvent = null;
    ReceiveSharingIntent.reset();
  }
}

IncomeShareEventMedia _mapMedia(SharedMediaFile media) {
  var type;

  switch (media.type) {
    case SharedMediaType.IMAGE:
      type = IncomeShareEventMediaType.image;
      break;
    case SharedMediaType.VIDEO:
      type = IncomeShareEventMediaType.video;
      break;
    case SharedMediaType.FILE:
      type = IncomeShareEventMediaType.file;
      break;
  }

  return IncomeShareEventMedia(
    path: media.path,
    thumbnail: media.thumbnail,
    duration: media.duration,
    type: type,
  );
}
