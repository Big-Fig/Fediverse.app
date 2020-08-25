import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/localization/localization_service.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:fedi/disposable/disposable.dart';

class LocalizationService extends AsyncInitLoadingBloc
    implements ILocalizationService {
  @override
  final LocalizationBloc localizationBloc = LocalizationBloc();
  @override
  Future internalAsyncInit() async {
// nothing by now
  }

  @override
  void dispose() {
    super.dispose();
    localizationBloc.dispose();
  }
}

class LocalizationBloc extends Disposable {
  //
  // Constructor
  //
  LocalizationBloc() {
    _actionController.stream
        .listen(_onData, onError: _onError, cancelOnError: true);
  }

  //
  // Stream to handle the _easyLocalizationLocale
  //
  StreamController<Resource> _controller =
      StreamController<Resource>.broadcast();
  StreamSink<Resource> get _inSink => _controller.sink;
  Stream<Resource> get outStream => _controller.stream.transform(validate);

  final validate = StreamTransformer<Resource, Resource>.fromHandlers(
      handleError: (error, stackTrace, sink) => sink.addError(error),
      handleData: (resource, sink) => sink.add(resource));

  //
  // Stream to handle the action on the _easyLocalizationLocale
  //

  void onChange(Resource resource) {
    if (!_actionController.isClosed) {
      _actionController.sink.add(resource);
    }
  }

  final StreamController<Resource> _actionController =
      StreamController<Resource>();

  // Function get onError => _actionController.sink.addError;

  @override
  void dispose() {
    _actionController.close();
    _controller.close();
  }

  void reassemble() async {
    //recreate StreamController when hotreloaded or reloaded
    await _controller.close();
    _controller = StreamController<Resource>.broadcast();
  }

  Future _onData(Resource data) async {
    // Catch error from json parse/load
    try {
      await data.loadTranslations();
      if (!_actionController.isClosed) _inSink.add(data);
    } catch (e) {
      _onError(e.toString());
    }
  }

  void _onError(data) {
    if (!_actionController.isClosed) _inSink.addError(data);
  }
}
