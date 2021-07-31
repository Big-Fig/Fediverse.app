import 'package:easy_dispose/easy_dispose.dart';
import 'package:easy_dispose_flutter/easy_dispose_flutter.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_bloc.dart';
import 'package:fedi/app/timeline/local_preferences/timeline_local_preference_bloc.dart';
import 'package:fedi/async/loading/init/async_init_loading_bloc_impl.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class HashtagPageBloc extends AsyncInitLoadingBloc
    implements IHashtagPageBloc {
  final Uri instanceUri;

  @override
  final RefreshController refreshController;

  String get userAtHost;

  @override
  final ScrollController scrollController = ScrollController();

  IPleromaApiTimelineService get pleromaApiTimelineService;

  @override
  final IHashtag hashtag;

  @override
  ITimelineLocalPreferenceBloc get timelineLocalPreferenceBloc;

  HashtagPageBloc({
    required this.instanceUri,
    required this.hashtag,
  }) : refreshController = RefreshController() {
    scrollController.disposeWith(this);
    addCustomDisposable(() => refreshController.dispose());
  }
}
