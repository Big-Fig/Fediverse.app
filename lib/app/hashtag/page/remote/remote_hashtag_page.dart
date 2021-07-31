import 'package:fedi/app/async/pleroma/pleroma_async_operation_helper.dart';
import 'package:fedi/app/hashtag/hashtag_model.dart';
import 'package:fedi/app/hashtag/page/hashtag_page_widget.dart';
import 'package:fedi/app/hashtag/page/local/local_hashtag_page_bloc.dart';
import 'package:fedi/app/hashtag/page/remote/remote_hashtag_page_bloc.dart';
import 'package:fedi/app/hashtag/page/remote/remote_hashtag_page_bloc_impl.dart';
import 'package:fedi/app/hashtag/status_list/network_only/hashtag_status_list_network_only_list_timeline_widget.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc.dart';
import 'package:fedi/app/instance/remote/remote_instance_bloc_impl.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc.dart';
import 'package:fedi/app/status/list/network_only/status_network_only_list_bloc_proxy_provider.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc.dart';
import 'package:fedi/app/status/pagination/network_only/status_network_only_pagination_bloc_proxy_provider.dart';
import 'package:fedi/app/status/status_model.dart';
import 'package:fedi/app/ui/async/fedi_async_init_loading_widget.dart';
import 'package:fedi/collapsible/owner/collapsible_owner_widget.dart';
import 'package:easy_dispose_provider/easy_dispose_provider.dart';
import 'package:fedi/pagination/list/pagination_list_bloc.dart';
import 'package:fedi/pagination/pagination_model.dart';
import 'package:pleroma_fediverse_api/pleroma_fediverse_api.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc.dart';
import 'package:fedi/ui/scroll/scroll_controller_bloc_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RemoteHashtagPage extends StatelessWidget {
  const RemoteHashtagPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HashtagPageAppBarWidget(),
      body: const SafeArea(
        child: RemoteHashtagPageBodyWidget(),
      ),
    );
  }
}

MaterialPageRoute createRemoteHashtagPageRoute({
  required Uri remoteInstanceUri,
  required IHashtag hashtag,
  required IRemoteInstanceBloc remoteInstanceBloc,
}) =>
    MaterialPageRoute(
      builder: (context) => Provider.value(
        value: remoteInstanceBloc,
        child: ProxyProvider<IRemoteInstanceBloc, IPleromaApiInstance>(
          update: (context, value, previous) => value.pleromaApiInstance!,
          child: RemoteHashtagPageBloc.provideToContext(
            context,
            hashtag: hashtag,
            child: const RemoteHashtagPage(),
          ),
        ),
      ),
    );

Future goToRemoteHashtagPage(
  BuildContext context, {
  required Uri remoteInstanceUri,
  required IHashtag hashtag,
}) async {
  var dialogResult = await PleromaAsyncOperationHelper
      .performPleromaAsyncOperation<IRemoteInstanceBloc>(
    context: context,
    asyncCode: () async {
      var remoteInstanceBloc = RemoteInstanceBloc.createFromContext(
        context,
        instanceUri: remoteInstanceUri,
      );

      await remoteInstanceBloc.performAsyncInit();

      return remoteInstanceBloc;
    },
  );

  var remoteInstanceBloc = dialogResult.result;
  if (remoteInstanceBloc != null) {
    await Navigator.push(
      context,
      createRemoteHashtagPageRoute(
        remoteInstanceUri: remoteInstanceUri,
        hashtag: hashtag,
        remoteInstanceBloc: remoteInstanceBloc,
      ),
    );
  }
}

class RemoteHashtagPageBodyWidget extends StatelessWidget {
  const RemoteHashtagPageBodyWidget();

  @override
  Widget build(BuildContext context) {
    var remoteHashtagPageBloc = IRemoteHashtagPageBloc.of(context);

    return FediAsyncInitLoadingWidget(
      asyncInitLoadingBloc: remoteHashtagPageBloc,
      loadingFinishedBuilder: (context) =>
          DisposableProxyProvider<ILocalHashtagPageBloc, IScrollControllerBloc>(
        update: (context, hashtagPageBloc, _) => ScrollControllerBloc(
          scrollController: hashtagPageBloc.scrollController,
        ),
        child:
            ProxyProvider<IRemoteHashtagPageBloc, IStatusNetworkOnlyListBloc>(
          update: (context, hashtagPageBloc, _) =>
              hashtagPageBloc.statusNetworkOnlyListBloc,
          child: StatusNetworkOnlyListBlocProxyProvider(
            child: ProxyProvider<IRemoteHashtagPageBloc,
                IStatusNetworkOnlyPaginationBloc>(
              update: (context, hashtagPageBloc, _) =>
                  hashtagPageBloc.statusNetworkOnlyPaginationBloc,
              child: StatusNetworkOnlyPaginationBlocProxyProvider(
                child: ProxyProvider<IRemoteHashtagPageBloc,
                    IPaginationListBloc<PaginationPage<IStatus>, IStatus>>(
                  update: (context, hashtagPageBloc, _) =>
                      hashtagPageBloc.statusPaginationListBloc,
                  child: ProxyProvider<
                      IPaginationListBloc<PaginationPage<IStatus>, IStatus>,
                      IPaginationListBloc>(
                    update: (context, value, previous) => value,
                    child: const CollapsibleOwnerWidget(
                      child: HashtagStatusListNetworkOnlyListTimelineWidget(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
