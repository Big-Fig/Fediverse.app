import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:fedi_app/app/hashtag/hashtag_model.dart';
import 'package:fedi_app/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi_app/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi_app/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:unifedi_api/unifedi_api.dart';

abstract class HashtagPageBloc extends AsyncInitLoadingBloc
    implements IHashtagPageBloc {
  final Uri instanceUri;

  @override
  final RefreshController refreshController;

  String get userAtHost;

  @override
  final ScrollController scrollController = ScrollController();

  IUnifediApiTimelineService get unifediApiTimelineService;

  @override
  final IHashtag hashtag;

  @override
  ITimelineLocalPreferenceBlocOld get timelineLocalPreferenceBloc;

  HashtagPageBloc({
    required this.instanceUri,
    required this.hashtag,
  }) : refreshController = RefreshController() {
    scrollController.disposeWith(this);
    addCustomDisposable(refreshController.dispose);
  }
}
